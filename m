Return-Path: <SRS0=lRQl=SJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27269C433EF
	for <soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D33B1C340E6; Tue, 25 Jan 2022 17:11:44 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13117C340E0
	for <soc@kernel.org>; Tue, 25 Jan 2022 17:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13117C340E0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B69CC3F339
	for <soc@kernel.org>; Tue, 25 Jan 2022 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643130702;
	bh=A8H8dxFjft/me9aEVAf7almjxfAoMnYXlO242MCpw7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pjW8tyDAIr/lb70Hq2nxgm7GXRXA4rBIG3x0FWRdEqKmhez/Wn4cGbBauEP2gO1Tj
	 lWZsoDKIXINb5pv1mFbOPRbWy5qG0up0uC7qF92iXY+s2xAPK3S25HjU0V8kgqxYiS
	 +6LYhnhw3TBASmG7FUmu5j4bc5K0iqQX5KufmGVDRIniCxjc54HeIOG4KMfwhcMRMR
	 IPtcBGMag4QfqK5YmnmtEF4Trfy+5nV7mcFhUFawxU07pUWRpGnYWadqVlIXNdl0hs
	 fMjNc+pfRDxdy0d0o5twqXTT7z1ytijEKZ/63FXnGV2qbl9Cee5Bnd1S1bbRkoK2qK
	 eGFS304/E2YOA==
Received: by mail-wr1-f70.google.com with SMTP id g8-20020adfa488000000b001d8e6467fe8so3337037wrb.6
        for <soc@kernel.org>; Tue, 25 Jan 2022 09:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8H8dxFjft/me9aEVAf7almjxfAoMnYXlO242MCpw7g=;
        b=M8Pt+HRi2GgJR0RYYjMKsZI+XugiIu9cxkZmJKTckigLSuKUNE9IpMy7KceqQ4hv1y
         ePQ6vAMgt/egLY7oQZXFSP9aNfz5ewsh66g7O1Q6SRrb4jZw+TFdSjgZBzEDQN6k4mYw
         jYkrh2MIM0ywHymrMjeA+q6neyAwxJW78UoQgk0KR6vIeosV3PGo2ufJKx7GHwVG5Xs+
         l3WCviYfG2LPTQYICh7hvoAquEVZe8eXwblq36CaUSMjtSbCLlh+qRwzNmYSTonwtXwS
         uOojBZuQWf5XFJwTugGqhOTr6q3HcRIsS2umn6N+k+ij5C1OnUI9ZYMmvj5oeMx8QlSP
         UGpA==
X-Gm-Message-State: AOAM533OKmeHBdUzB1Qwz0BO0WiEfoGFBybftvocOlQbXn5O5kXrgNlI
	rxwt0CHnJYPaYvx823FrhUVKS1mfal++llKMv32CgOsxjwT2Xosr/ldXL0uoZ6jzmpKjPEJEI0g
	/tidt1NFiXTggo5pqvNMzZvY=
X-Received: by 2002:a7b:c0cb:: with SMTP id s11mr1830416wmh.127.1643130702242;
        Tue, 25 Jan 2022 09:11:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZRJJtk6Eg4pUW404OW2S98mBrHu5GF+pAy4IkydvzhbzWujRUD5vT98QX9iYAdGBg/AxRvA==
X-Received: by 2002:a7b:c0cb:: with SMTP id s11mr1830401wmh.127.1643130702108;
        Tue, 25 Jan 2022 09:11:42 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h127sm4477087wmh.2.2022.01.25.09.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	catalin.marinas@arm.com,
	soc@kernel.org,
	linux-clk@vger.kernel.org,
	arnd@arndb.de,
	robh+dt@kernel.org,
	Ajay Kumar <ajaykumar.rs@samsung.com>,
	linux-fsd@tesla.com,
	olof@lixom.net,
	pankaj.dubey@samsung.com,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	sboyd@kernel.org,
	s.nawrocki@samsung.com,
	linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v5 12/16] pinctrl: samsung: add FSD SoC specific data
Date: Tue, 25 Jan 2022 18:11:04 +0100
Message-Id: <164313066043.81586.3206885780884369059.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-13-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124142946epcas5p11997a3c37546d37cac91f690a2a602bf@epcas5p1.samsung.com> <20220124141644.71052-13-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 24 Jan 2022 19:46:40 +0530, Alim Akhtar wrote:
> Adds Tesla FSD SoC specific data to enable pinctrl.
> FSD SoC has similar pinctrl controller as found in the most
> Samsung/Exynos SoCs.
> 
> 

Applied, thanks!

[12/16] pinctrl: samsung: add FSD SoC specific data
        commit: 0d1b662c374c54bcf68bbcff3b71e6d6e945a7cf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
