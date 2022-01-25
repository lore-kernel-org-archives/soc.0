Return-Path: <SRS0=lRQl=SJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145B9C433F5
	for <soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB8C7C340E7; Tue, 25 Jan 2022 17:11:43 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A137C340E6
	for <soc@kernel.org>; Tue, 25 Jan 2022 17:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A137C340E6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 85F833F1E0
	for <soc@kernel.org>; Tue, 25 Jan 2022 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643130701;
	bh=w7pNveLS0GBUcaM6xZHDvqGiuHIf5TR0krpcnow2fyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hqugDulmFV/YpJbTPBNKQtXXj3OCUXpThQUF+/NUp8Gt2EwQZKBnhvcs41NYBKFZO
	 piUu24l5/PCp0fpK6R4goyAOzWrvTrx8qWjTEx55rlvucfs6N7EcMGGnshggQTnCkl
	 BoUYo3Yiq9dN0t3KS5j9LpViBIm0s79S4XXZDS8kP4oODqBcQhLTbjKKxKR5unjUrA
	 oBq2JLNmGk93VohCJwDT6tC9aIdnBS80XQYxFeGUWFG4tdpqrUwWML8+ZynBI4Ndrt
	 Vvcd0KlIhZKGUE4aemziVwUSPkVI8ksN1Vq8f1kwmc07U2pQJmcdi7qkR9Zr9j/MgG
	 E5YS8DFfdfeWw==
Received: by mail-wr1-f72.google.com with SMTP id j21-20020adfa555000000b001db55dd5a1dso1835890wrb.15
        for <soc@kernel.org>; Tue, 25 Jan 2022 09:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7pNveLS0GBUcaM6xZHDvqGiuHIf5TR0krpcnow2fyo=;
        b=ORPek6lKbZnXr6CgvQrGOZBSmsivIEBJiuyqVv++TCrEsKLAaIgk/U0Ur9P0kFk7j/
         bt+o8+aP26nFa43OQKrUHR4do8Ujfck99O6+wyKTWoT3g1efZ2kyLdKVdsMePNZ83z6J
         ZSNWY7XwyIf/1bJV79A3vNbakIyDASboXagDpUAyz1O2YG+uTv79/FnzuUzoWMej/u7F
         6DLJhXu81jkpOyIqZvB+vC8mtSYPBQZkFZaBMXoAIuW3j51OSWrqYySm+1NNOt6xFkXq
         01zUJ/Mrr66pcTgDKSHp1POVOXt9wj+B3u4zP3gTr6X8HD/mbYvPgk2H0vJ2bKrHB0yP
         iJRw==
X-Gm-Message-State: AOAM531U4Oc3AAzZ26sHFVmlW1wC7Us3YmVSN3xoxA5TSjcottMIPHHf
	JSyYwCy1/CKegpiU1i3IzzltpAdeMr9oRbbcjCXh3MBOkz59SHnJUt8i584WUIssa8HRzxKzh0S
	yF6jaPyVBmTCaooG7tnwLZbE=
X-Received: by 2002:a05:600c:4282:: with SMTP id v2mr3842240wmc.78.1643130700830;
        Tue, 25 Jan 2022 09:11:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0UJNIa6CQvbeScVNkgkIbqxoZi3ySJ1nOLLm6MxdhJFLNeQKvajyCF1/0whS+dTxXoqrw0Q==
X-Received: by 2002:a05:600c:4282:: with SMTP id v2mr3842215wmc.78.1643130700627;
        Tue, 25 Jan 2022 09:11:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h127sm4477087wmh.2.2022.01.25.09.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org,
	catalin.marinas@arm.com,
	linux-clk@vger.kernel.org,
	arnd@arndb.de,
	robh+dt@kernel.org,
	linux-fsd@tesla.com,
	olof@lixom.net,
	pankaj.dubey@samsung.com,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	sboyd@kernel.org,
	s.nawrocki@samsung.com,
	linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v5 11/16] dt-bindings: pinctrl: samsung: Add compatible for Tesla FSD SoC
Date: Tue, 25 Jan 2022 18:11:03 +0100
Message-Id: <164313066043.81586.10760195237607935843.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-12-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124142941epcas5p4bbba53cfc2fc9862da9fd85d44de6e79@epcas5p4.samsung.com> <20220124141644.71052-12-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 24 Jan 2022 19:46:39 +0530, Alim Akhtar wrote:
> Add compatible for Tesla Full Self-Driving SoC. The
> pinctrl hardware IP is similar to what found on most of the
> Exynos series of SoC, so this new compatible is added in
> Samsung pinctrl binding.
> 
> 

Applied, thanks!

[11/16] dt-bindings: pinctrl: samsung: Add compatible for Tesla FSD SoC
        commit: 98ed04b33f43a80c0d9e218023abce3b47ca3539

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
