#An interface for the stivale2 C library

module Stivale2
    VERSION = "0.1.0"
    STIVALE2_HEADER_TAG_ANY_VIDEO_ID = 0xc75c9fa92a44c4db
    STIVALE2_HEADER_TAG_FRAMEBUFFER_ID = 0x3ecc1bc43d0f7971
    STIVALE2_HEADER_TAG_FB_MTRR_ID = 0x4c7bb07731282e00
    STIVALE2_HEADER_TAG_SLIDE_HHDM_ID = 0xdc29269c2af53d1d
    STIVALE2_HEADER_TAG_TERMINAL_ID = 0xa85d499b1823be72
    STIVALE2_HEADER_TAG_SMP_ID = 0x1ab015085f3273df
    
    STIVALE2_FIRMWARE_BIOS = (1 << 0)
    STIVALE2_TERM_CB_DEC = 10
    STIVALE2_TERM_CB_BELL = 20
    STIVALE2_TERM_CB_PRIVATE_ID = 30
    STIVALE2_TERM_CB_STATUS_REPORT = 40
    STIVALE2_TERM_CB_POS_REPORT = 50
    STIVALE2_TERM_CB_KBD_LEDS = 60
    STIVALE2_TERM_CB_MODE = 70
    STIVALE2_TERM_CB_LINUX = 80
    STIVALE2_TERM_CTX_SIZE = 0xFFFFFFFF_u64
    STIVALE2_TERM_CTX_SAVE = 0xFFFFFFFE_u64
    STIVALE2_TERM_CTX_RESTORE = 0xFFFFFFFD_u64
    STIVALE2_TERM_FULL_REFRESH = 0xFFFFFFFC_u64
    
    STIVALE2_HEADER_TAG_5LV_PAGING_ID = 0x932f477032007e8f
    STIVALE2_HEADER_TAG_UNMAP_NULL_ID = 0x92919432b16fe7e7
    STIVALE2_STRUCT_TAG_PMRS_ID = 0x5df266a64047b6bd
    STIVALE2_PMR_EXECUTABLE = 1_u64 << 0_u64
    STIVALE2_PMR_WRITABLE =   1_u64 << 1_u64
    STIVALE2_PMR_READABLE =   1_u64 << 2_u64
    
    STIVALE2_STRUCT_TAG_KERNEL_BASE_ADDRESS_ID = 0x060d78874a2a8af0
    STIVALE2_STRUCT_TAG_CMDLINE_ID = 0xe5e76a1b4597a781
    STIVALE2_STRUCT_TAG_MEMMAP_ID = 0x2187f79e8612de07
    
    STIVALE2_MMAP_USABLE =                 1
    STIVALE2_MMAP_RESERVED =               2
    STIVALE2_MMAP_ACPI_RECLAIMABLE =       3
    STIVALE2_MMAP_ACPI_NVS =               4
    STIVALE2_MMAP_BAD_MEMORY =             5
    STIVALE2_MMAP_BOOTLOADER_RECLAIMABLE = 0x1000
    STIVALE2_MMAP_KERNEL_AND_MODULES =     0x1001
    STIVALE2_MMAP_FRAMEBUFFER =            0x1002
    STIVALE2_STRUCT_TAG_FRAMEBUFFER_ID = 0x506461d2950408fa
    STIVALE2_FBUF_MMODEL_RGB = 1
    STIVALE2_STRUCT_TAG_EDID_ID = 0x968609d7af96b845
    STIVALE2_STRUCT_TAG_TEXTMODE_ID = 0x38d74c23e0dca893
    STIVALE2_STRUCT_TAG_FB_MTRR_ID = 0x6bc1a78ebe871172
    STIVALE2_STRUCT_TAG_TERMINAL_ID = 0xc2b3f4c3233b0974
    STIVALE2_STRUCT_TAG_MODULES_ID = 0x4b6fe466aade04ce
    STIVALE2_STRUCT_TAG_RSDP_ID = 0x9e1786930a375e78
    STIVALE2_STRUCT_TAG_EPOCH_ID = 0x566a7bed888e1407
    STIVALE2_STRUCT_TAG_FIRMWARE_ID = 0x359d837855e3858c
    STIVALE2_STRUCT_TAG_EFI_SYSTEM_TABLE_ID = 0x4bc5ec15845b558e
    STIVALE2_STRUCT_TAG_KERNEL_FILE_ID = 0xe599d90c2975584a
    STIVALE2_STRUCT_TAG_KERNEL_FILE_V2_ID = 0x37c13018a02c6ea2
    STIVALE2_STRUCT_TAG_BOOT_VOLUME_ID = 0x9b4358364c19ee62
    STIVALE2_STRUCT_TAG_KERNEL_SLIDE_ID = 0xee80847d01506c57
    STIVALE2_STRUCT_TAG_SMBIOS_ID = 0x274bd246c62bf7d1
    STIVALE2_STRUCT_TAG_SMP_ID = 0x34d1d96339647025
    STIVALE2_STRUCT_TAG_PXE_SERVER_INFO = 0x29d1e96239247032
    STIVALE2_STRUCT_TAG_MMIO32_UART = 0xb813f9b8dbc78797
    STIVALE2_STRUCT_TAG_DTB = 0xabb29bd49a2833fa
    STIVALE2_STRUCT_TAG_HHDM_ID = 0xb0ed257db18cb58f

    @[Packed]
    struct Anchor
        property anchor = StaticArray(UInt8, 15).new(0)
        property bits = 0_u8
        property phys_load_addr = 0_u64
        property phys_bss_start = 0_u64
        property phys_bss_end =
        property phys_stivale2hdr = 0_u64
    end

    @[Packed]
    struct Stivale2_Tag
        property identifier = 0_u64
        property next_ = 0_u64
    end

    @[Packed]
    struct Stivale2_Header
        property entry_point = 0_u64
        property stack = 0_u64
        property flags = 0_u64
        property tags = 0_u64
    end

    @[Packed]
    struct Stivale2_Header_Tag_AnyVideo
        property tag = Stivale2_Tag.new
        property preference = 0_u64
    end

    @[Packed]
    struct Stivale2_Header_Tag_FrameBuffer
        property tag = Stivale2_Tag.new
        property width = 0_u16
        property height = 0_u16
        property bpp = 0_u16
        property unused = 0_u16
    end

    @[Packed]
    struct Stivale2_Tag_SlideHDDM
        property tag = Stivale2_Tag.new
        property flags = 0_u64
        property allignment = 0_u64
    end

    @[Packed]
    struct Stivale2_Header_Tag_Terminal
        property tag = Stivale2_Tag.new
        property flags = 0_u64
        property callback = 0_u64
    end

    @[Packed]
    struct Stivale2_Header_Tag_SMP
        property tag = Stivale2_Tag.new
        property flags = 0_u64
    end

    @[Packed]
    struct Stivale2_Struct
        #This will problably introduce a bug but who cares!
        property bootloader_brand = StaticArray(UInt8, 64).new(0)
        # Same with this
        property bootloader_version = StaticArray(UInt8, 64).new(0)
    end
end
