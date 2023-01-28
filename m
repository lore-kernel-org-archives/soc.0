Return-Path: <SRS0=fJuS=5Z=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA9CC27C76
	for <soc@archiver.kernel.org>; Sat, 28 Jan 2023 19:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5279AC4339B; Sat, 28 Jan 2023 19:38:35 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 715EDC433D2;
	Sat, 28 Jan 2023 19:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 715EDC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so11806597pji.5;
        Sat, 28 Jan 2023 11:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hQK4C1L9MM/JFGnVX6eKMfVvu+bqRQpbwVoxrbSJECk=;
        b=bVPYcP9m4wDe6/z5e9kGmAYe7OnI8g/7hJeFNg8Z/aPI64F5wLOryOjzK9SGBQW2uI
         Yfz1Bo0XKSR9IJPEntNoP/U2VkDDcHuQ6AQ1JpL+jH8/l3G3sMLUkyF9JwF+tfaX2Rhg
         Km6YPLXJUK5aku4KNul2QPW7jmiKRusr0xslugjzwGZD2MX1jC8zy7KiyKmeBWr6uDSt
         BbnCxj7DQ4n6ytyFWpafceXeQGthWn+ioCjWFhoZ6rkEbF49gTmgmnD93g5XnbXtk7o4
         /2YylMIWfVgeeTrQRUjW2+f/hd66LkqqOU42/PUpaooCtZK2j5KptDf6GTXDvzMqHcP4
         OezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQK4C1L9MM/JFGnVX6eKMfVvu+bqRQpbwVoxrbSJECk=;
        b=olmtq9AhBbBlPpzOo/bfnftJidF2aywpmE1gnnGIJ0xk/pwmD+hAVhAVUliVT3dzXg
         So9epdVegKIxbc9kDiqRwnxmOjZ5HgB676khs7tKyVLDHMzF59/ZHFETn1O/V4YfvQQR
         P8l6NjTNfPEIUFyEE4VF/E7yy8Y6dn7Ut3kPJuqxZmipMbGg5Z8Tms/CfdSuY2tksOrz
         dp465k4D2v2CJHF890Pw98TgG847Xiq1d21MJGPYvKCoXaIQyTrqPYgbFTe2gjXLwwWq
         WmBtCEQot5/2U6OF6lMIayjJ3bFXJdnbjivr3FkZktQycb46Rm7bfmv2lsON4z2mT0Uf
         Swng==
X-Gm-Message-State: AO0yUKV6zmWTBzRPCa3XimSlAQwd5fyiWVw0lwkmqRY7PtD4TmjrJq57
	zlB3D9Mbs/2RpdNRp2HhkcOcAey/Tr0FAg==
X-Google-Smtp-Source: AK7set+MHLEzju9ip6Jk9z9QuE5DyhquKkTXhpwBflqoWtxThJSqmyhO30dEQJj2zDUFxr9ngzYplw==
X-Received: by 2002:a05:6a21:6da8:b0:bc:c456:962b with SMTP id wl40-20020a056a216da800b000bcc456962bmr878611pzb.14.1674934713252;
        Sat, 28 Jan 2023 11:38:33 -0800 (PST)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id o18-20020a639212000000b0047850cecbdesm4096043pgd.69.2023.01.28.11.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 11:38:32 -0800 (PST)
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
Subject: [GIT PULL 2/5] Broadcom devicetree changes for 6.3
Date: Sat, 28 Jan 2023 11:38:29 -0800
Message-Id: <20230128193829.1628773-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.3/devicetree

for you to fetch changes up to 031eeba1102c02c3479c687278d6dbabe5e4c78b:

  ARM: dts: broadcom: align UART node name with bindings (2023-01-23 10:07:41 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM SoCs Device Tree updates for
6.3, please pull the following:

- Krzysztof aligns the various Broadcom SoCs DTS UART nodes with the
  binding convention to use "serial"

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: broadcom: align UART node name with bindings

 arch/arm/boot/dts/bcm11351.dtsi       | 8 ++++----
 arch/arm/boot/dts/bcm21664-garnet.dts | 2 +-
 arch/arm/boot/dts/bcm21664.dtsi       | 6 +++---
 arch/arm/boot/dts/bcm28155-ap.dts     | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
