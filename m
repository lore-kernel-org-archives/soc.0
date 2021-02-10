Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E285FC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 19:05:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BEC464E32
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 19:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BEC464E32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z0WxYMYRYsljvatrW44SZchcdm03J9I8v3x+zz0g+Mw=; b=Jg+pAwGt/70tIcnRXYGNImlntg
	LQhtuGcrWk7JJhsnoY+dWNfNbTs4KMy1qfABG9u8iEjaZzwjUIWW0wbAdG8BP/rh3pg6MJSrx+Hsb
	Cjq6yckVf78FGRLYD9KtPCM4cXeTfcemufnMn6OKEIEyr42qZgsZNqRq9naaf27HinQzERCqal/R6
	Hn6nmJ3NPvebINudkHVtnZPOBYEFbHXThn8qqh1z7hIuB2U8+RahEMUzyqRFEegDO042ZJDAZ7tUw
	HHCs8cEzTb/eHALKToz+3KSqSVXnkFcDuYy92bqjScX70tuYF4dIvA6f+NB6SD00GBWuHNv19wKOz
	sVP7q0Aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9une-0003nm-OW; Wed, 10 Feb 2021 19:05:18 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9una-0003mc-1U
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 19:05:15 +0000
Received: by mail-lf1-x129.google.com with SMTP id d24so4460975lfs.8
 for <linux-riscv@lists.infradead.org>; Wed, 10 Feb 2021 11:05:11 -0800 (PST)
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
 b=dn/8w68Oj0o/mBPkdqfQvjNWQV6sQNNIUDtbQgEh160UlXmw/5SAr+3tTqRgDFK1x/
 WlRWBk+LDjrDQCJUXs/T6yQ3szGDx+DX8VKaqG3V5m2Vi8D2Aq1Vsya7ikGLNW/79fJ1
 UIcWJXi7AsD47u7O1Qd9x+UuDPSdZco2eiFQ0a15KSgxOPxhXzl/i7WBvaanjDImOgGf
 4nd8uJ7j0sABLdB8iulTpUKYLwF9seIW8T5ivIm4YEvVIv2KX72IkG0eJ/W5iKcNoAmQ
 M/uzF6mffwiNqfhqQ/aRqWNKtqbegOZynwkozs/qGIDIsSmBkINn1cjB+hEre5a96g9g
 kKxA==
X-Gm-Message-State: AOAM5323sB7CzC0HlvfB20phLQrch7bYaM3cxZCSWFzJpbHZRzEN9VPg
 ErpEVaZdw9sGOws0GRFrlDkddw==
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
X-CRM114-CacheID: sfid-20210210_140514_103750_C1B9BE66 
X-CRM114-Status: GOOD (  11.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210190506.vrea_lFAjDQbkEPdXBa2tOKzT-jcpXRfHoeaYqkYCMU@z>

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
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
