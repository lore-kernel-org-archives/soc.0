Return-Path: <SRS0=PVSr=RH=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9023C433EF
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 15:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C181C36AEB; Wed, 22 Dec 2021 15:19:35 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6320C36AEA
	for <soc@kernel.org>; Wed, 22 Dec 2021 15:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6320C36AEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f43.google.com with SMTP id g11-20020a4a754b000000b002c679a02b18so922191oof.3
        for <soc@kernel.org>; Wed, 22 Dec 2021 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4vxInVd5/b2eYWbb1CMQfr/Pn8SF9EAOp9chCCisCA=;
        b=F8PLjFPEkujiUsUzqrHLOvOW0VuZlmxMoOafplabubIPD9vU4PSj9TIa+5hj2PCteX
         Jq6sTR10mnCKpdR5rLeeIuM3nyNgK0APQkJHApyjBbvLvfcKUNp4GYgzneplNS3RJq8q
         6fzQiNRybyGaBX2SPXQPVE9BidT2lnEl4/SLsf0p8C+XhkC81GdLQ/ACGVKz2IM/Ji/4
         oPFtvUlIYj92hSBnMcHwrIrAmjm6SDKJbjC4vPkqSfG0/a6sI7o+yHBu+GwQ9v71Whzd
         3f302zvQvr0IExDuiXgg0z+p1GBxvHTajVQY/2JuxFhXA11LV31euvsOL/tn3BRzOL4K
         Ab1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4vxInVd5/b2eYWbb1CMQfr/Pn8SF9EAOp9chCCisCA=;
        b=KefAsPCPPWCK6w2ojX7xfEL77t5Ofh2BWcjr1g8L4+dfqXqE50F1ii5C2LMjHNSbvX
         2EBfvv85K1wWnW+J0fMgyp5eM7FwmMD1HXIKkzbHz/O6EEzkMtavy1N+5luja1PybYOA
         A+BmV8Vnpmi15HUE9kWXqcgqqjnZ4CeRsSgjMBSJavIeB72TWUkQ/1nppGGvuiWeQCcf
         d+j15JrNAL53VQIY9tcil5Bh6c/AYP8DXePaynLrrp0qjytABpJdx1hcmmF6v7EObhWf
         YMIRjNOkjhplsz5PFYPEsQqVx0/tGDcwcgUMBAahG4HMmdouQiHlFLMMudlRg/AA+Vsp
         zxyQ==
X-Gm-Message-State: AOAM5327mLeqlnlOwxyERSE8jGdVgeJQQfGDttXuahpCT/EG0oNbX4Go
	jnt3CcQhqs5Yiy2GFH841Psk/g==
X-Google-Smtp-Source: ABdhPJws5lU9BMGDVVY24FxzOa2rTfkuWBDryO30FhY7Mnw2Mo3Etk59mpGoTjmuSmO4lRCRGrogCg==
X-Received: by 2002:a4a:dc9a:: with SMTP id g26mr400461oou.71.1640186373780;
        Wed, 22 Dec 2021 07:19:33 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y12sm422018oiv.49.2021.12.22.07.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 07:19:33 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v5.17
Date: Wed, 22 Dec 2021 09:19:29 -0600
Message-Id: <20211222151929.3752565-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This updated tag for v5.17 fixes the build breakage due to missing
SM6125_VDDCX, and while at it adds two patches enabling USB support on the
SM8450.

Regards,
Bjorn

The following changes since commit bf0a257a9418ebcbe6ab2a73728f76969942e52a:

  arm64: dts: qcom: sm8450: add i2c13 and i2c14 device nodes (2021-12-15 16:30:58 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.17-1

for you to fetch changes up to c23f1b77358c173a25ef21303d2a8cc893e9ce22:

  arm64: dts: qcom: sm6125: Avoid using missing SM6125_VDDCX (2021-12-22 09:08:13 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree updates for v5.17

This introduces initial support for the brand new Snapdragon 8 Gen 1,
aka SM8450 platform, with SMP, CPUfreq, cluster idling, low speed buses,
TLMM pinctrl, SMMU, regulators, clocks, power-domains, UFS storage and
USB currently supported.

SDM845 adds new support for Sony Xperia XZ2, XZ2C and XZ3. The Lenovo
Yoga C630 gains a few audio related fixes. The PMIC's VADC channels are
described as thermal zones. OnePlus devices gains msm-id and board-id,
to facilitate a single firmware image for the multiple devices.

On SM8350 the Sony Xperia 1 III and 5 III, as well as initial
description of Microsoft's Surface Duo 2 are introduced.  On the
platform side, LLCC, QUP nodes, redistributor stride and all the
low-speed QUPs are added

MSM8996 gained various regulator fixes, and adsp firmware name to
faciliate pushing firmware to linux-firmware. Xiaomi Mi Note 2 gained
touchkey controller definition.

On SDM660 the Xiaomi Redmi Note 7 gained power and volume keys, RPM and
regulator definitions, USB, eMMC and SD-card and a simple-framebuffer
description.

MSM8916 has the mmc aliases corrected, to stop the storage devices to
move around and the RPM sleep stats memory is described. Support for the
Samsung J5 2015 smartphone is introduced.

SM6350 validation errors are fixed and and description of the audio,
compute and modem remoteprocs are added.

A couple new revisions of the SC7180 based Google devices are added.
The SC7280 platform gains venus and a few fixes. The CRD development
device is introduced, with the EC, touchscreen and touchpad.

On SM8250 CPU opp-tables, for scaling L3 cache and DDR frequency based
on CPU frequency, are added. As is TX, RX macros and SoundWire blocks
and used to enable audio on the SM8350 MTP.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: dts: qcom: sm6125: Avoid using missing SM6125_VDDCX

Vinod Koul (2):
      arm64: dts: qcom: sm8450: Add usb nodes
      arm64: dts: qcom: sm8450-qrd: Enable USB nodes

 arch/arm64/boot/dts/qcom/sm6125.dtsi    |  4 +-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 23 +++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 89 +++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 2 deletions(-)
