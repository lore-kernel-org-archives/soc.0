Return-Path: <SRS0=NPTw=VM=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AB7C433F5
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 21:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 800EDC385B1; Wed,  4 May 2022 21:09:51 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4DFB5C385A4;
	Wed,  4 May 2022 21:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4DFB5C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id qe3-20020a17090b4f8300b001dc24e4da73so4367443pjb.1;
        Wed, 04 May 2022 14:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xxZpPQ09APBLBJTZfiQ9M3tMr7+h1AAfLZpLAA+jiRA=;
        b=Q/wdv+HbEgSfkLACejiuwOw43QaLL2Ykc86e9VMxtGuykSGYYolNdtN5O02EI5euqc
         QVg4s34g9GmCJJo0irH12iSuQX/YS2Oac1PAfCQzvtlB8WJ0NzYxW56+pkdvY29B4plV
         Uw2xnGq+z4W/o6recoGZOHWC1u7WQBoW/mborhryaSEkqOvuCfAosLnk/MBlwUgp6POu
         BEizUt2MGtKTujUspvUnwlgsvJJccPquDo/YtTSp/1uRQdxtWc1cwE+kEDm50wzFVgb8
         1g/I9FQ4tLMiVd18bJJUPDmtw746BwRFjAmadKHCKMlipGMRpj8Frsk/szX4blXouhDR
         fqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xxZpPQ09APBLBJTZfiQ9M3tMr7+h1AAfLZpLAA+jiRA=;
        b=tFequ+036XZNRSK+WKC9SEPz1RbOOHTvG40tGTFKnQ9wd6fyrWO9PJWnGapnRB7DyD
         tv3ildAZps8opt8HZtN49c/rLRrP64yhuCliyL1Wo1vjIVRrX/JO6FUYO1vvEooWkLZV
         nmLz8ZM90+5pOTEMqAGU7KzEAyIqAiiBsctL6eLjRBvAkQardLL92/RTNNX2sBAbJ0eM
         zkt0gqTGEvO3YZ19Odwn9om+07EBv7uaHn5zkohL4RLb8qnrkF9flp82rp2KWQOabE5O
         aVLFHPTr3urS5b1TuV/U56Yhs6EtSRtPU4A/BrWkQb6oA9Qyw5lH6HIJhDgAw3G9hK/T
         DBBQ==
X-Gm-Message-State: AOAM533/mpijYKfE3KW5GTsUZwSziV9Rux7dHnA8CA+4AGFdhcAM6quH
	ZBYAXDtBhNkNwvD1HiZVLRXcnYJh1/Y=
X-Google-Smtp-Source: ABdhPJw9C2iDy+L+SiVK4TOEPSK4OPz7LpBrzN7KZvKXAl/0fdC4DSjPV+0E88dxEZaW47YS4LIaMQ==
X-Received: by 2002:a17:902:6acc:b0:149:8f60:a526 with SMTP id i12-20020a1709026acc00b001498f60a526mr23901766plt.25.1651698589514;
        Wed, 04 May 2022 14:09:49 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r11-20020a63204b000000b003aaf27b5ceasm14820457pgm.1.2022.05.04.14.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 14:09:49 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/6] Broadcom devicetree-arm64 changes for 5.19
Date: Wed,  4 May 2022 14:09:39 -0700
Message-Id: <20220504210942.1838248-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210942.1838248-1-f.fainelli@gmail.com>
References: <20220504210942.1838248-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/devicetree-arm64

for you to fetch changes up to ad2c6e3cdd6121bdabf0726355dbe04b987c92e0:

  arm64: dts: broadcom: align SPI NOR node name with dtschema (2022-04-07 11:57:07 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs changes for 5.19,
please pull the following:

- Krzysztof fixes the SPI NOR Device Tree node name to comply with the
  dtschema

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: broadcom: align SPI NOR node name with dtschema

 arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts  | 2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2-xmc.dts  | 2 +-
 arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dts | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
