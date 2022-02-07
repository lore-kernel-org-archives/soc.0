Return-Path: <SRS0=xhsa=SW=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17CBC433FE
	for <soc@archiver.kernel.org>; Mon,  7 Feb 2022 17:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2A49C340ED; Mon,  7 Feb 2022 17:56:04 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BA4E9C340F2
	for <soc@kernel.org>; Mon,  7 Feb 2022 17:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BA4E9C340F2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D0FD74003D
	for <soc@kernel.org>; Mon,  7 Feb 2022 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1644256553;
	bh=/iBTMJ+6ky1LxQGNpybYW4PAzENXOdLtJcm5RBsECOE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=V5d0m/4qdB7Nm6++fc67OeUMzx2V68AtjKom+YqGUa+23fABwUKuXR3H3sQeYoDDD
	 yYAGgvWQBBDG/YrFxwy8Ncooki5TEHCAVEpY5YQAG9lKQ4wOzyYve5zwvWnQyZIgGi
	 +BwNkfbCnj2+VEQVJnyL9QzEwW3va+rsTqXa7lnOspXtu5UfTLNUrMuPGSDrWn/5+z
	 OFP3cyfRv5MwXeco5Xb9Qk0UCmY1OdwnvLejuopdzzzqE/ecItrwu04tFErEb0sPZX
	 7Yu53M83oQH93END6tvXb92TgNDM1Pc6d+CyYbDiy/KvKalJl57G6iBEWNh8c/nfOy
	 /b2hQQR5HVMxg==
Received: by mail-ej1-f71.google.com with SMTP id 13-20020a170906328d00b006982d0888a4so4591520ejw.9
        for <soc@kernel.org>; Mon, 07 Feb 2022 09:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/iBTMJ+6ky1LxQGNpybYW4PAzENXOdLtJcm5RBsECOE=;
        b=IrwSMhwCZ6jIXqaI2dt3Mrmw8c0vVwKdZ1qykrr89PQ+ZY0LGvSq5JE8hCwYuj+O9Y
         h5jufy/k+wcw2s5IEwS2pjAYwAKsnAbKSJEKq5G3yI6VMYOSijm8BLexu7HPyC9MHe8R
         BJXmYDOEMBX4umMTJwDaaHMvoBjyqitxuwVNpkEqWm6B7QXLDPlc8WwCY1kh8jb8NTDj
         MYpkO974SLhu93a8AS/Pz1oXPMw/JtuNNaj1nOVT/tVGXU9qVsP7aGvsDfVEXn0nt/fY
         eXhAf/7Gn+LKPkIK+j71OVZ/7+Vm1UVPKvUQjLh1lZy9LP8ZjTaX5oFXQ0HY3MADaXvj
         a8FA==
X-Gm-Message-State: AOAM533DJuDWg8rPVjTjsfT4ktn6rsMv1edCbvWfED691GT+9YBi5bOa
	YAUa1JsF6gBCjybhaCTD/rW5QmMzyulnJlQpxBo/m7SOb8Olh+QBUHCnUjxSVgeSjWZta62rC9c
	fX+OV5p7kWxhippOVGgm4nzM=
X-Received: by 2002:a05:6402:26c2:: with SMTP id x2mr645539edd.354.1644256552645;
        Mon, 07 Feb 2022 09:55:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfa4i/V4nQftL4p3cvH4Fqz5Bqxsqs8spXP4wBR5nEJrSoNdf/WpjgVi+7ZOVjQ3pIOe/m6w==
X-Received: by 2002:a05:6402:26c2:: with SMTP id x2mr645526edd.354.1644256552505;
        Mon, 07 Feb 2022 09:55:52 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c20sm3765210edy.41.2022.02.07.09.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 09:55:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] MAINTAINERS: arm: samsung: add Git tree and IRC
Date: Mon,  7 Feb 2022 18:55:02 +0100
Message-Id: <20220207175503.425200-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add already used Krzysztof Kozlowski's Git tree for Samsung
S3C/S5P/Exynos ARM sub-architecture and IRC channel (#linux-exynos at
Libera).  This documents purely existing state.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 49c897fa56af..e219ba2c5ac9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2577,7 +2577,9 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+C:	irc://irc.libera.chat/linux-exynos
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
 F:	Documentation/arm/samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -15346,6 +15348,7 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+C:	irc://irc.libera.chat/linux-exynos
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
 F:	Documentation/devicetree/bindings/pinctrl/samsung,pinctrl*yaml
-- 
2.32.0

