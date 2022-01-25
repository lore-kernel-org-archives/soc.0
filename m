Return-Path: <SRS0=lRQl=SJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC04C433EF
	for <soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4CC30C340E9; Tue, 25 Jan 2022 17:11:59 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99596C340E8
	for <soc@kernel.org>; Tue, 25 Jan 2022 17:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99596C340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5AAA8402F0
	for <soc@kernel.org>; Tue, 25 Jan 2022 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643130717;
	bh=LvBwPzZuQYg1sk1AcEyVLVG7UxYbxMueMK9OojLw1Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CY7PK8+b4bB9aoCAUW0tERxpxzO0v2nWOQ0fzR7bvxf0uuXmbre7Zc06Vd/PnuyS0
	 O8uBlpcNoiSNJOquriY5l5fBTFqrJhKrDQXqd/BtaNpn7lUcg3dxRYtP6ZI62MgtNR
	 CkCfJuKdyLVJwA2pEo58ykbTMKNophQQJGFncYp4vV6TOd3JShy5Il1XiCbXKMueo8
	 OvhTk5ChHAZ9Hx+RkjVtBR1OFBkIodANZahKQrmEjfYTpY5+lao3+BJYmcGFAZeggB
	 8YX2YBKG1WBJ+I3DFeTMIVGzLGb2Dyu3qNvnkArmMgIjA90gdO9aVDwEK2l18aaWNb
	 MTmNZlV+AtUcg==
Received: by mail-wr1-f70.google.com with SMTP id c10-20020adfa30a000000b001d79c73b64bso3349286wrb.1
        for <soc@kernel.org>; Tue, 25 Jan 2022 09:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LvBwPzZuQYg1sk1AcEyVLVG7UxYbxMueMK9OojLw1Q4=;
        b=AtI37pWhG73rv+W44qDUAscx3Hq2T5wPu+t81tu8jJ/64sH+gL25xU8AYciWBEGYUz
         +DV/BHVw/G99Oe/1UFUnctGy/KjAgXgoD7BXhPcnaFzHHCLNZZJTqiCxyh+P4mOJC+49
         +kPTKa1duw6NW3OwEUH60JCSAR0Fk0uEBUihkf9U5f0Mgm1swf9gnF5909il2rOeWVye
         aT3QFG8fNYCYelD5VTfiBpJYzE+qSihPxqgEkDKcNh68AF9SJWyeVUE3PDcAsnHxTWi3
         gsBRFmelhTMUFA/Asny8cRulICGGQi+G7aPEsXnWRNUoMPpe7jAueMqqyhkBM81aPNXW
         5Hqw==
X-Gm-Message-State: AOAM5334kthbih4ohJUm3jcNhOEw1uKoW5DM6kVklLDTk/vxvw7J0fJ0
	J/hkSuhBjXbVClkouocGDDk+iUhYWvcJN3HuB3EBJwhNJSPCsroIgrtfGtLQfFKQHYIgYRElOe+
	JBsD3EZvYt/4bOJGnlbtcxbg=
X-Received: by 2002:a05:600c:4b95:: with SMTP id e21mr3819807wmp.106.1643130716926;
        Tue, 25 Jan 2022 09:11:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfP17LMlnVHGMliQrz4/SA8fpjZEApa5SVjlONjtvltbKWP+dIusViDktiO3K5mmPtxTR73g==
X-Received: by 2002:a05:600c:4b95:: with SMTP id e21mr3819792wmp.106.1643130716796;
        Tue, 25 Jan 2022 09:11:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f8sm1185826wmg.44.2022.01.25.09.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linus.walleij@linaro.org,
	linux-fsd@tesla.com,
	devicetree@vger.kernel.org,
	olof@lixom.net,
	soc@kernel.org,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	arnd@arndb.de,
	linux-samsung-soc@vger.kernel.org,
	catalin.marinas@arm.com,
	robh+dt@kernel.org,
	pankaj.dubey@samsung.com,
	s.nawrocki@samsung.com
Subject: Re: (subset) [PATCH v5 16/16] arm64: defconfig: Enable Tesla FSD SoC
Date: Tue, 25 Jan 2022 18:11:07 +0100
Message-Id: <164313065136.81319.934364321640879263.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-17-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124143005epcas5p103598aa358ac35fe5e1ee762faf508b0@epcas5p1.samsung.com> <20220124141644.71052-17-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 24 Jan 2022 19:46:44 +0530, Alim Akhtar wrote:
> This patch enables the Tesla FSD SoC in arm64 defconfig.
> 
> 

Applied, thanks!

[16/16] arm64: defconfig: Enable Tesla FSD SoC
        commit: aeb62e360c0fffd9cf218a314647d0c7254becbe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
