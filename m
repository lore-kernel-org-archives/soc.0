Return-Path: <SRS0=lRQl=SJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC76C433EF
	for <soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C69BC340E7; Tue, 25 Jan 2022 17:11:54 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 104D0C340E6
	for <soc@kernel.org>; Tue, 25 Jan 2022 17:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 104D0C340E6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BF12540052
	for <soc@kernel.org>; Tue, 25 Jan 2022 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643130712;
	bh=g7yYrXHImPhCQwOj0UskOn25n3xq1OGmRzWasb1bHQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hkdgSmAcmhMivsu2URlDkCXI8f63RavIJYIzrssxpjF1rnioTXzejmjLjtnZ6qPvf
	 xnqUJS/AVKxZxn6/OSmfufnnU2veX8jPodPaXTf9ftVnQp2m6EEp2ou0cln9sW59ya
	 fBlTS9I7bf+2r+3JVU+EiJUkjRQwMyt1RnPVTxQ4botx5jnQ3eZfD4XFuzkDHit2GX
	 tP9CbpmovQtBDPJJT26Ys9nZM1YsNtQ5N3VyQrdXOL/qsyCou2qJyhxqoWmz3x2Faj
	 KFOu3mEZBYE8ndQEnlkux4R1GB+8PrxYA4d37Sucns4ZTGTfGq4VZPfaIBA1h3edA7
	 wuy2KPSKxrllA==
Received: by mail-wr1-f70.google.com with SMTP id q14-20020adfaa4e000000b001dd761d46c7so404034wrd.4
        for <soc@kernel.org>; Tue, 25 Jan 2022 09:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g7yYrXHImPhCQwOj0UskOn25n3xq1OGmRzWasb1bHQQ=;
        b=rEGb0jmfo3e8VJmGHMyllwNhc43IOxuRB6mS8E8TptMOgQqNbO7yggGhCGnaNvrQDe
         xH3WuxJS5r4ClI98aCLjXQYMUECwmlAMeJqG3rDeYiZBCaK8RQQv+IIBcqiOmst7Q6p+
         nQxkROLesqg8nKfpctLofzBZ2H8xy/1doylF/MVc4zmOd3vNcTDpgRQ7eUXckaLY8Q6h
         pCibo+NMvEaiVfZZ+ZrPr9AX7MdVW5KvuLXeO3PAd2+yEOAk6WgzDVJMc5rsg7rY3kbD
         YUvUEP7Lzxmlp7HumSGryGWMkFUj231YsmUmJiia5GatBGPMSB7IlhXaFhVOILPmE3IN
         uHJQ==
X-Gm-Message-State: AOAM533xjlVvvdOfDJVVmZcU/eMw3x+J1RvXlDXOJOkPtIbrOFjBZ+oM
	nq76F4MbUHfpdTFr6LRNeQzuA5Qv83yt7fwI4hDgWRjGrwtLg20RbYaoEQogGfLxUu21o8mQoXp
	nPexwXDJTBfxWKpgw77sR/mc=
X-Received: by 2002:adf:e592:: with SMTP id l18mr18490652wrm.217.1643130712378;
        Tue, 25 Jan 2022 09:11:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmNgL2L2/wufXJkt0M/aVg1sqAVlqZZAkIIrefWSMS+S6RErnsKS/CAuAI5H838RBZZxTQ1g==
X-Received: by 2002:adf:e592:: with SMTP id l18mr18490639wrm.217.1643130712199;
        Tue, 25 Jan 2022 09:11:52 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f8sm1185826wmg.44.2022.01.25.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	devicetree@vger.kernel.org,
	linux-fsd@tesla.com,
	linus.walleij@linaro.org,
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
Subject: Re: (subset) [PATCH v5 13/16] dt-bindings: arm: add Tesla FSD ARM SoC
Date: Tue, 25 Jan 2022 18:11:04 +0100
Message-Id: <164313065136.81319.902005401446620690.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-14-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124142951epcas5p255712c3a9e37b9542687587d8114bda3@epcas5p2.samsung.com> <20220124141644.71052-14-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 24 Jan 2022 19:46:41 +0530, Alim Akhtar wrote:
> Add device tree bindings for the Tesla FSD ARM SoC.
> 
> 

Applied, thanks!

[13/16] dt-bindings: arm: add Tesla FSD ARM SoC
        commit: d25c5eb511df3439cd91517bcbce4b274f8972b9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
