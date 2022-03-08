Return-Path: <SRS0=eDiF=TT=linaro.org=anders.roxell@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF746C433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 12:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77F6BC340EC; Tue,  8 Mar 2022 12:19:44 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76AB4C340EB
	for <soc@kernel.org>; Tue,  8 Mar 2022 12:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76AB4C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id w27so31878355lfa.5
        for <soc@kernel.org>; Tue, 08 Mar 2022 04:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a949UFK8TIX5ZVNaSFCn5mxBv9wqXzD6DnUk1Klh2s4=;
        b=z8FevG9uFrB9OKUKwLSr+Ahd73o/R4ouLWoQxUP7MQ/b7g0dnZyHUNAzPUYYIDtOp8
         Zj8Sn6ersZ/yAoiL9lN+qwF6V2vQch2ZYBXFf+OxWKdijCWfVDBFLPLeICBcNz9wyUC2
         HXED8BqYlL7Ggio7Zq9iVVqwvpn6p9v/o04TjbBHTOc02Tc1Be8viNoep7F9kNAPgMoW
         /VROfFUN0VQYOUDobV7wtBQnuo1GLsi/SASx6GFmiKQEi+WwTEc0whI7h3mh6rkA6aGG
         FUD27pTvn3Sek5MsJwtNx0NdsXKmcvZUhSKwDcWZLnMlchR1i2Mwq5Afdq5ZhNQz335i
         Yc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a949UFK8TIX5ZVNaSFCn5mxBv9wqXzD6DnUk1Klh2s4=;
        b=wv+rkWoPw4ZM+HmcSdXb+/nfByogWEorfko29rojZsFMAvlX300vPdbuVU20pZjjhr
         Pjj2sBpanuq3GuZKpqB8UPGzNCTLoSRV6MVNLRStskKmjarSOHyya/KgPCO4XZ5YAF3i
         jOJRIg8HerUfpy9FsmYNTURVw2oFMg1Tie4h3hsWfKlkMkiCfaRt97DTVO3zW8MA0Dvd
         yxdb6bwSRvc274Nhf1DfvN8PUxjOBDq9zlb53pT2PZS3ZSDTn0AqSa6V5y+GntF/HJZf
         y+tVkPfGIzO1F59SC5VWsrSst0FwXzVXY7NMWFISHJ62P1uR0uUJzsx7Lk7iAkYmHzcI
         WbJw==
X-Gm-Message-State: AOAM530Nqj5JPdVIc+YJ4je5IycTB61DIShiL9lq2DUTaV5UdsUcEB+l
	drRd11luYL+/DJonKOJA//QbGS3bvGZzZ6Tl
X-Google-Smtp-Source: ABdhPJzb9sc1puN0GmA4MXgyXFDkw9QbWxlgmVLXEL8OuRSoHRpzGmp0ScrueQEtlO7DiR/XOibqZw==
X-Received: by 2002:a19:8c50:0:b0:448:3d35:c060 with SMTP id i16-20020a198c50000000b004483d35c060mr2304403lfj.689.1646741981449;
        Tue, 08 Mar 2022 04:19:41 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id j8-20020a196e08000000b0044313d10b4dsm3450250lfc.14.2022.03.08.04.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 04:19:41 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] arm: multi_v5: enable configs for versatile
Date: Tue,  8 Mar 2022 13:19:33 +0100
Message-Id: <20220308121933.3967868-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it possible to boot a versatile machine in qemu.

Boot command:
 /usr/bin/qemu-system-arm -cpu arm926 -machine versatilepb \
  -nographic -nic none -m 256M -monitor none -no-reboot \
  -kernel zImage -dtb versatile-pb.dtb \
  -append "console=ttyAMA0,115200 rootwait root=/dev/vda" \
  -drive armv5_rootfs.ext4,if=none,format=raw,id=hd0 \
  -device virtio-blk-pci,drive=hd0

When doing build and boot testing, it makes more sense to enable arch
vesatile, serial amba_pl011 and virtio (mmio|blk|pci) to
multi_v5_defconfig to make that boot out of the box, with a modern
virtio (mmio|blk|pci) driver. Using the above commandline. Another way
to build and boot would be to use tuxmake/tuxrun. Tuxmake [1] builds the
kernel, and Tuxrun [2] boots the kernel in qemu. Both projects uses
podman to do the build/tests inside.  This makes both project a good
tool to use when finding a regression that you would like someone else
to reproduce with the exact same setup.

tuxmake --runtime podman --target-arch arm \
        --toolchain gcc-11 --kconfig multi_v5_defconfig
tuxrun --tuxmake ~/.cache/tuxmake/builds/3072 --device qemu-armv5

[1] https://tuxmake.org/
[2] https://tuxrun.org/

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/arm/configs/multi_v5_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index fe8d760256a4..db5b52e77b94 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -85,6 +85,8 @@ CONFIG_NET_PKTGEN=m
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
 CONFIG_PCI_MVEBU=y
+CONFIG_ARCH_VERSATILE=y
+CONFIG_PCI_VERSATILE=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_IMX_WEIM=y
@@ -111,6 +113,9 @@ CONFIG_EEPROM_AT24=y
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=m
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_BLK=y
 CONFIG_CHR_DEV_SG=m
 CONFIG_ATA=y
 CONFIG_SATA_AHCI=y
@@ -144,6 +149,8 @@ CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_ASPEED_VUART=m
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_ATMEL=y
 CONFIG_SERIAL_ATMEL_CONSOLE=y
 CONFIG_SERIAL_ATMEL_TTYAT=y
-- 
2.34.1

