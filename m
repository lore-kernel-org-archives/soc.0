Return-Path: <SRS0=HRIu=QL=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EE4C433EF
	for <soc@archiver.kernel.org>; Wed, 24 Nov 2021 08:50:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6345660FE6; Wed, 24 Nov 2021 08:50:53 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128DF60F5D
	for <soc@kernel.org>; Wed, 24 Nov 2021 08:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 128DF60F5D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9A3743F1E5
	for <soc@kernel.org>; Wed, 24 Nov 2021 08:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1637743849;
	bh=8rWN9fOOpn66OKlATgOHPUAlhVTLfd9Epzs5crIJx9c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=RviBR5ND3TEeqYLuDNSjR5jHBXt+uf8Y9yeH1C1jgh/3q8MTXJqRJ7YqJTtyAmf5l
	 9XvotLG4BpJKIOIy9tMSilGEv+lXLntSvaztgG69mu3iW4uvPZJThcu/1I1Y3CnTyw
	 WlxHFwWWQ/7kef0KmJYKXuNbOgDBbvaqzMSWpoEK0wd3vw8nO1xZ+ckbupiW1oXZoR
	 hSWvbsZDya0Aufvo+emsN4gtqcFP/O3baHnAE6tHaLUJXAf3hdArstcy4CbFHUxJs9
	 leMQBvKUeO++vHc7O5xXUxerDOS0Vn4lxtnFrQiGm+ypOh02ejn6r/E1yl5hKat/vX
	 9JlcvyslwXm7w==
Received: by mail-lj1-f199.google.com with SMTP id z18-20020a2e8e92000000b00218e583aff1so580534ljk.1
        for <soc@kernel.org>; Wed, 24 Nov 2021 00:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8rWN9fOOpn66OKlATgOHPUAlhVTLfd9Epzs5crIJx9c=;
        b=vTvJ6EoR7+bx5Iy/LDo+AkBuESzDsc7krSXQJn/Lvt/Do8DpELtGdFqqwcU7Jjr8fA
         r61CU1pl0EEh3y/gLy91PSloX8x9GmiqlDhHlHIm7ViYcABQumZSYfob8pn/aDQmaSY8
         huk7OUJfFy/72FfpPWPTwh7pj9xUMeyVvdaoEuRg33Mx76pmoVyIEihnDZh5rjezHQUc
         kOzzGk6+2dG6tB+kXjNTfSA+iKwA3RA5oKdD02VU1+RVM4guhOsClFJ3qVKujG5jPjkR
         tjrFDrQEDJK71e3AZNM6a/fvsaDvk5v25Z77CcR+vNDRncnJGJWEsAoKFX7KonYHu4xT
         gmGw==
X-Gm-Message-State: AOAM531wcGmFueSsZHBBvRd+BAWXeGTBwXrgx5tAfjnzq5ef6NlWEs5m
	l3BmnohRFzr7oK6qwN1/ce46PjXK1Ptwd/0evZ4UnEqxRMWBdMaq7CBEsOqt+K3cPGaywjRqO3S
	v4vBoIoXRfvQ+rzRviljR4Ec=
X-Received: by 2002:ac2:5fcf:: with SMTP id q15mr12365546lfg.642.1637743848010;
        Wed, 24 Nov 2021 00:50:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyB7pGFjfOdXdXqxnFUErhhvCeBQ+G7lhbhQG88gmm1pe6z542g39/LQuskD8jLfTgOk7uI1g==
X-Received: by 2002:ac2:5fcf:: with SMTP id q15mr12365537lfg.642.1637743847869;
        Wed, 24 Nov 2021 00:50:47 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id t12sm1742952ljg.63.2021.11.24.00.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:50:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 0/2] fixes for current v5.16: arm64/dts and drivers
Date: Wed, 24 Nov 2021 09:50:40 +0100
Message-Id: <20211124085042.9649-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

I have two fixes for current cycle, in two different trees so I combined
them in patchset here:
1. Samsung ARM64 dts fix,
2. Memory controller drivers fix.

Both fix commits merged during this v5.16-rc1 merge window.

Best regards,
Krzysztof
