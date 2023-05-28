Return-Path: <SRS0=8gjP=BR=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7D2C77B7E
	for <soc@archiver.kernel.org>; Sun, 28 May 2023 00:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A607C433EF; Sun, 28 May 2023 00:10:40 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23DE8C433D2;
	Sun, 28 May 2023 00:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23DE8C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3f80e055549so9610641cf.3;
        Sat, 27 May 2023 17:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685232636; x=1687824636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMCsGvkoxWSUFyaRQ4KyoqEeH9gxDpYDK1XiImU4CBA=;
        b=r18LUXZbEyf295PSaklp4P9NGUmzPbTYzCAwdHwZtRNoSN4MoWP2YuVp0GrIvexMeR
         0dvZK3/dzViFqtqSyIVKcS75h47Z0HTRdZULgLqHn2pijGNSXfYcVcXPL0hrV6LrRbm7
         IX8y8whrqzZgXL+eL5zMEHBOGAGQtjUhnaRSRsbI9xAtH6fwP4sRU+lNPC64EJu6xyVN
         EDKroP22n1mKX+NLw59ouc86TefbafTsydeKStJtYZOP8nCuX96jJIMZJft6AfGIcFcd
         iOlQpbN0xsl0XMoaCYaseu5Hk9mHZgNMJPIabNvxynvvt+MYt2fjdaILPYyFh4JA3DMm
         1phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685232636; x=1687824636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMCsGvkoxWSUFyaRQ4KyoqEeH9gxDpYDK1XiImU4CBA=;
        b=fQtbrpMArMb/ZvsGBz3GN7k3rfFXse0KGBCZM507egKzxKaK9l/pEYSYUc9sZwNAlC
         0GI7W2aV0tg6tiXv1jHQsgeq9V80ZXhugrnVvVdPPE35/t85+Aa3YWTFsHwDQa7TsJWu
         jBw5FpiKRhqCGmVHecs3Z20b6KCYe7tZ4jMesuu+16Cd1FBIlBYMo3TipWRo//uUhIcq
         BongsBUzUU5RLLqb8BzMOqOXweN2Azj0H2I1TmEY/crtY1YfNZHXaY/CSQf3keJDUdsh
         9mQ0oVDddq8DTOytGHvMP/2kW+VgjQoHeEH+P0dxrXp9SH+ejYSWEFoWKNfh0kIPRh4Q
         bxWA==
X-Gm-Message-State: AC+VfDzqbSu49DzlWhzPFfQ4lSN+bIA1RVBVm26ACz7jvKy1UiYxq9kb
	f9W0hEgKMmdSzqBCZj/uNcCb4qtBqHx3Iw==
X-Google-Smtp-Source: ACHHUZ7MIP/VcIjwshjdNl1IQZV0vU+2dA96XzmQnwrcz12nJc3u2smpOSknIIHBeMqz6BwKzt6pug==
X-Received: by 2002:a05:622a:3d1:b0:3f2:f35:8e6f with SMTP id k17-20020a05622a03d100b003f20f358e6fmr6671214qtx.25.1685232636346;
        Sat, 27 May 2023 17:10:36 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:28b2:2867:6311:b7d0])
        by smtp.gmail.com with ESMTPSA id t18-20020ac865d2000000b003f6a7ab1450sm2518454qto.30.2023.05.27.17.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 17:10:35 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Rudraksha Gupta <guptarud@gmail.com>
Subject: [PATCH v2 0/4] Samsung Galaxy Express SGH-I437 Support
Date: Sat, 27 May 2023 20:10:05 -0400
Message-Id: <20230528001010.47868-1-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230527040905.stmnoshkdqgiaex6@ripper>
References: <20230527040905.stmnoshkdqgiaex6@ripper>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Samsung Galaxy Express SGH-I437.
Currently the following things work on this phone: UART, eMMC, SD Card, and USB.

version 2:
- Combined patch 1 into patch 4, as the sleep_clk label is specifically needed for the USB node.
- Reformatted the commit messages to align with the style used in other commit messages that modify the same files.
- Included a cover letter to provide an overview of the patch series.
- Slight refactoring of the device tree source (DTS) file.

Rudraksha Gupta (4):
  dt-bindings: arm: qcom: Add Samsung Galaxy Express
  dt-bindings: Add qcom,usb-hs-phy-msm8960
  ARM: dts: qcom: msm8960: Add USB node
  ARM: dts: qcom: Add Samsung Galaxy Express support

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/phy/qcom,usb-hs-phy.yaml         |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/qcom-msm8960-samsung-expressatt.dts   | 334 ++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8960.dtsi           |  35 +-
 5 files changed, 371 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8960-samsung-expressatt.dts

-- 
2.34.1

