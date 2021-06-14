Return-Path: <SRS0=R97b=LI=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0405FC2B9F4
	for <soc@archiver.kernel.org>; Mon, 14 Jun 2021 19:33:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DA18E6128A; Mon, 14 Jun 2021 19:33:14 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FCA761153
	for <soc@kernel.org>; Mon, 14 Jun 2021 19:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FCA761153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-ed1-f72.google.com ([209.85.208.72])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lssKe-00008t-PA
	for soc@kernel.org; Mon, 14 Jun 2021 19:33:12 +0000
Received: by mail-ed1-f72.google.com with SMTP id df3-20020a05640230a3b029039179c0f290so19119438edb.13
        for <soc@kernel.org>; Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sfJlofv21SpGZDidrB7CsJ8MDr7P7vCKWMcgZ/+7/iM=;
        b=q4AWmRkoOaZoZjG9JpU2vjcSXImegMS0C/+z2Ed6LHH/H6uSdoRfZXZTwqSAYzB21K
         DDPebJIczzzJIGSUNUWhC7SfPzR9BLpG9huBzYHK7DbrvwLh/Fm8x61UoAZBvqv1SFbl
         LWW8nJhfVHLI72bB8IaFBV92ouPav+Wn6bdFoxY17SwdInzfY7IC5R4aJ8sHU9OOhSXS
         MJLM3OXSRbo9uY/enxlwcJcCls1RbekjAWviPRL2ApN4TCEZSxD2ndydUyrS3GK4KvlU
         SboPWyVYY8BtZNL5zqy707HPB7MJLRYaHLyQZ6TicjgPO7RYsrKGlKYqQ28v6efLuD1D
         6DUQ==
X-Gm-Message-State: AOAM531CVUkDeKDUFBsstWerZs75XI1T6EKmOoyIjqcq9SzFBUEtok78
	B8QXR7d9m2Wb+J+v0RfFdmydCrqit+H+7VpCzS8EvM1/JJL4VlfO5fTcIsoCDE87FCxf+lG0LIh
	xatYPsCttV1UtG212pqAGytI=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr19246391edt.194.1623699192598;
        Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUwBAD6ChY0/D6TIhrxmWKERXF7uVQl6lBAKO7NbZ1+r6uaIe7co3RLS1phU3lsvHL6vuvqA==
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr19246378edt.194.1623699192513;
        Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id gw7sm8029291ejb.5.2021.06.14.12.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 0/2] ARM/arm64: Samsung pull for v5.14, second set
Date: Mon, 14 Jun 2021 21:33:07 +0200
Message-Id: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

For arm64 DTS I have only one patch so sending as is. Second pull request is
for defconfig changes.

Best regards,
Krzysztof

