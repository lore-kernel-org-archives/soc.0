Return-Path: <SRS0=lRQl=SJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630BCC433F5
	for <soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B063C340E0; Tue, 25 Jan 2022 17:11:58 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BC19C340E7
	for <soc@kernel.org>; Tue, 25 Jan 2022 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9BC19C340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 66F644004F
	for <soc@kernel.org>; Tue, 25 Jan 2022 17:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643130715;
	bh=Eq37txspH2phodHd9XBEM6IFXJwB351PQd0cul0xPxo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=i3vxSJLw7gC9U3XSELBEQWNBokeKWgLClftdBRevLz8r0mXgslU+/m+4ExyeG8Rkp
	 pgKnika4RuLZbAs6AEallBgaLIJKzkIoS/QrUiSqSrQlrBtQp5FoK/CEnvPUJOPKf7
	 oolQCKJjy+WR2KyRR/iPRx6WWy3mm++THMm3xp3da4C+OQ8OBu+PNEAt4uXUlY4deH
	 crUCrdC+ZMKMkarR5/3UT7UCAiJz3Q0JMKGWjZbMKFw3EfJj2DmjAvZB26BrNXiqkJ
	 Q7aXOJSW0FnRkAsWi8KDuPcm7khm1x1fXBTywti8U60On7cyG2JGrXu2uJhp2wQdXM
	 AZoDlniPXkc/g==
Received: by mail-wm1-f70.google.com with SMTP id d140-20020a1c1d92000000b0034edefd55caso1439284wmd.4
        for <soc@kernel.org>; Tue, 25 Jan 2022 09:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eq37txspH2phodHd9XBEM6IFXJwB351PQd0cul0xPxo=;
        b=ge0cPF01rqVME7wEE7nXcSlb+3BSTI9JYsKU5E5qJVftIeMK1PwkMOMpG/LtgG+rhm
         sgOAxE8UxXTq3v6X0PFWfLsvl6Ec8nw876Q9xK6WsGPs2vm79xrQRIf2EXv/iv0TG7u7
         1giHqQvhi9KpwZbmyy0Tl/lv7gNrrSQuyVpW68+jPzllqors8ND14uipejJ4fWJ/bpMs
         HV4dr9s2ULQrjTKVub91Nhyq/vQCcpu94+BuNehwcR28ERh9NtC3wIwijysBj5HL9MVX
         YJAFve9p/VW2ybg40Ws9lIbv/RsFbY7vPs9hmJaAlC+I0FqL7l5FQDwEnRHqtfQZEuhJ
         QcNA==
X-Gm-Message-State: AOAM533QiooPuI/bLIsNe2kN4+YTTskPN1Vl/cbVl/RWJ1Qtr/UBgFhA
	FHnoQJSO3lxvRJVFi146viHONzS2vxQqzKoxSC6q8PN7u1jaRNUn8jLRibnQlYnxFBup7WRUNPb
	nKqAIAq2tlBQP7ou1DMDnkWw=
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr3770877wmj.189.1643130715145;
        Tue, 25 Jan 2022 09:11:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrbdeHL0IlLxe23svOOleIzfku/tFpG1O9rOLv6Af/becvU1F5yAgCWPKlbpU8ULSRE8Matg==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr3770860wmj.189.1643130714957;
        Tue, 25 Jan 2022 09:11:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f8sm1185826wmg.44.2022.01.25.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	sboyd@kernel.org,
	olof@lixom.net,
	soc@kernel.org,
	linux-fsd@tesla.com,
	linux-clk@vger.kernel.org,
	arnd@arndb.de,
	linux-samsung-soc@vger.kernel.org,
	Shashank Prashar <s.prashar@samsung.com>,
	catalin.marinas@arm.com,
	Aswani Reddy <aswani.reddy@samsung.com>,
	robh+dt@kernel.org,
	pankaj.dubey@samsung.com,
	s.nawrocki@samsung.com
Subject: Re: (subset) [PATCH v5 15/16] arm64: dts: fsd: Add initial pinctrl support
Date: Tue, 25 Jan 2022 18:11:06 +0100
Message-Id: <164313065136.81319.15871986388224953551.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-16-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124143001epcas5p4c0aab0902709a24bbedadaa223fe7910@epcas5p4.samsung.com> <20220124141644.71052-16-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 24 Jan 2022 19:46:43 +0530, Alim Akhtar wrote:
> Add initial pin configuration nodes for FSD SoC.
> 
> 

Applied, thanks!

[15/16] arm64: dts: fsd: Add initial pinctrl support
        commit: 773d685fd406514af4b365aaa54fe493cf523602

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
