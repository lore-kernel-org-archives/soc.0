Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC64C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 19:06:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A8F764E42
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 19:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A8F764E42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4GNfFka1KgReM0us8I0m586WjlLu5Sw9/amEwqGa/+Y=; b=3QclJMVCgPyN76uKdVjUrG7lz1
	tG+Xvai59o4zna/5w/AOsa5anOkEgVdeIEOjALj2dggzYn4oAmzPcQ+mOSUKyeF7CVyaJRa5X4w9e
	TUMtyTKRYDRG2i/Kv5UFekewwZ5i9agSRKXko5XtF6vOkEpiMVBj7YCbW+Oyp+/5dg9V3FyU1JF4N
	ks3RP6uRvSqqjGlSYxFaPELXMsGdZkHnuP8yNXRW0pPVkQMJ0vQUU3CYyHHfWvnhWjcLb7kce4cVM
	SwIE3lZcLjwjKFD29SXsN/BKtviHYsyLePXxiC7/Zy56iUXucwUY8aJFoDkpJfGpk5GhjmQbwt7eT
	OqeRJU/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9und-0003nU-N2; Wed, 10 Feb 2021 19:05:17 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9una-0003mb-0Y
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 19:05:15 +0000
Received: by mail-lf1-x134.google.com with SMTP id h26so4503257lfm.1
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Feb 2021 11:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AUZZJPcdsZ4nXWPrdOtnVl3JVvpEylf0g26f/cJWrEs=;
 b=tdvdvopNJa/CNXblKmh3zsQ94QYlwXgnTc3W2rw3GKaWji6T1d806HNk5jlGGQsE0d
 Z3BzOj8nXe/DC40o+NAgzKZEhnAAmT+MybnSvLG2UiVRby+UfPnUmHXxsNbU7/THaivB
 IJok8KZuYBmdglvY9AXbeqg2N79bWTTZAvbuVrJ/jApGhi9wm0hMJLi3kDsrycTWwkH+
 KeQqcA/kzuUA1N4LUQGmsMhnfPeZKVkijrSX1wnSYD7t5hFI06+M7TAv4qerUeyHPFAm
 84uVebInrFDi44XE03vgB3Mbxtn8cTyAwnIJLm2UKF/hTrvWBymtDXcbDo+kC+Za5e0s
 IaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AUZZJPcdsZ4nXWPrdOtnVl3JVvpEylf0g26f/cJWrEs=;
 b=jeby6SumuuR0Lags3btgWymbZYAIHKMZoTEhxX/cNfbgq7e4zR0Mo0vV9RjluZHdPd
 3/Ocnr4Z3jdZw/ubwgbGiMD3uSrxP/q/u5MF5MJtYUj5OLiTqMbinVwv19LM+4Sr2nj1
 IipIcBPN9xmhUjRMAMUpCKvlxd7V4lu39jofpD+VcC2rsyZsAlmm77Ov5f+IhsU0BcnM
 U45pU1Rrm6REVgEbw2wavZ7ll6HG+gIjuFKL9o/K/Ysy4ZUI45i/kFj5uBMgkBnkZGK4
 bL3o8nkWgj4YLXtOhA95bUklEey+I3fek6sXqzW8h3qpLQqxwE4Yy1oCnEMNDcAOhCg6
 eExA==
X-Gm-Message-State: AOAM532tLWXjp6E5SFnBIlk6k5bhTQbZLYqHHCQXA8ng6rk6nASGuPEi
 mrychSyqTsyomlnFsFqGgxPIww==
X-Google-Smtp-Source: ABdhPJx+dGCB5Wuq+4IRhfx1FPsG7SMl/CyZGsYTUvPGsDbtVXH2raDj8I9KusXJvxhAT7I/ejZXMg==
X-Received: by 2002:a19:4843:: with SMTP id v64mr2309414lfa.178.1612983910472; 
 Wed, 10 Feb 2021 11:05:10 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id s16sm390025ljc.121.2021.02.10.11.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 11:05:09 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] arm64: defconfig: enable modern virtio pci device
Date: Wed, 10 Feb 2021 20:05:06 +0100
Message-ID: <20210210190506.1923684-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_140514_096750_80023E35 
X-CRM114-Status: GOOD (  12.83  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: chris@zankel.net, tsbogend@alpha.franken.de,
 Anders Roxell <anders.roxell@linaro.org>, mst@redhat.com, arnd@arndb.de,
 linuxppc-dev@lists.ozlabs.org, catalin.marinas@arm.com,
 linux-xtensa@linux-xtensa.org, paul.walmsley@sifive.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, jcmvbkbc@gmail.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, mpe@ellerman.id.au, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, will@kernel.org, jasowang@redhat.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210190506.zLxMohCU8XttcqI-8bjSg4PlsJAOtUhETLox9qDZUkQ@z>

Since patch ("virtio-pci: introduce modern device module") got added it
is not possible to boot a defconfig kernel in qemu with a virtio pci
device.  Add CONFIG_VIRTIO_PCI_MODERN=y fragment makes the kernel able
to boot.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig         | 1 +
 arch/arm64/configs/defconfig                | 1 +
 arch/mips/configs/loongson3_defconfig       | 1 +
 arch/mips/configs/malta_kvm_guest_defconfig | 1 +
 arch/powerpc/configs/guest.config           | 1 +
 arch/riscv/configs/defconfig                | 1 +
 arch/riscv/configs/rv32_defconfig           | 1 +
 arch/xtensa/configs/virt_defconfig          | 1 +
 kernel/configs/kvm_guest.config             | 1 +
 9 files changed, 9 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3823da605430..02297ed49b20 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -972,6 +972,7 @@ CONFIG_DW_DMAC=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_STAGING=y
 CONFIG_MFD_NVEC=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 83c28da85834..8334e9cb4608 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -910,6 +910,7 @@ CONFIG_TI_K3_UDMA_GLUE_LAYER=y
 CONFIG_VFIO=y
 CONFIG_VFIO_PCI=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_XEN_GNTDEV=y
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 0e79f81217bc..ac5f2dcbffb1 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -324,6 +324,7 @@ CONFIG_RTC_DRV_CMOS=y
 CONFIG_RTC_DRV_GOLDFISH=y
 CONFIG_DMADEVICES=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BALLOON=m
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
diff --git a/arch/mips/configs/malta_kvm_guest_defconfig b/arch/mips/configs/malta_kvm_guest_defconfig
index 9185e0a0aa45..043633cdb406 100644
--- a/arch/mips/configs/malta_kvm_guest_defconfig
+++ b/arch/mips/configs/malta_kvm_guest_defconfig
@@ -332,6 +332,7 @@ CONFIG_RTC_DRV_CMOS=y
 CONFIG_UIO=m
 CONFIG_UIO_CIF=m
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_EXT2_FS=y
diff --git a/arch/powerpc/configs/guest.config b/arch/powerpc/configs/guest.config
index 209f58515d88..fbff632c8633 100644
--- a/arch/powerpc/configs/guest.config
+++ b/arch/powerpc/configs/guest.config
@@ -5,6 +5,7 @@ CONFIG_NET_FAILOVER=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_VIRTIO=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_KVM_GUEST=y
 CONFIG_EPAPR_PARAVIRT=y
 CONFIG_VIRTIO_BALLOON=y
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 8c3d1e451703..b7fa7a1a0c6d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -85,6 +85,7 @@ CONFIG_MMC=y
 CONFIG_MMC_SPI=y
 CONFIG_RTC_CLASS=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 2c2cda6cc1c5..68296101fa06 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -84,6 +84,7 @@ CONFIG_MMC=y
 CONFIG_MMC_SPI=y
 CONFIG_RTC_CLASS=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
diff --git a/arch/xtensa/configs/virt_defconfig b/arch/xtensa/configs/virt_defconfig
index 6d1387dfa96f..7fad1c2454fd 100644
--- a/arch/xtensa/configs/virt_defconfig
+++ b/arch/xtensa/configs/virt_defconfig
@@ -74,6 +74,7 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_USB_SUPPORT is not set
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_INPUT=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
diff --git a/kernel/configs/kvm_guest.config b/kernel/configs/kvm_guest.config
index 208481d91090..8dea6df20006 100644
--- a/kernel/configs/kvm_guest.config
+++ b/kernel/configs/kvm_guest.config
@@ -22,6 +22,7 @@ CONFIG_S390_GUEST=y
 CONFIG_VIRTIO=y
 CONFIG_VIRTIO_MENU=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_VIRTIO_NET=y
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
