Return-Path: <SRS0=Lfaw=LI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC0DC2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 19:35:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F6461153
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 19:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F6461153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YEH5Kz8SnRQwZI+x5x383mDLlizX/p87pFSLaVyGs4Y=; b=w1W4QH+rBX+Nsw
	cGG8tnTrHKauGVFCnJtZAhJ4PdzHEdoeipC1Xj3HL4ljlseq8phhJV9OdQ0UG6ud/BE4VG93dgV0l
	EQi6tpEfDmqHPjYyJ/H7njs4PUU24L2brASjXeQCCz3ZRernshyWPPdP11IExNLThKpHop0LJYx2a
	WDFBR76LgCTNrzXZ3hAZvgyKg2KfB68WuhFQEWiThM2ttTrWpLbrEtCZL4G944DgqaLnDNYINz7fY
	Uj6BjisNfMlkSSaeTnlxdahRRURcYlJytkfvRFrksdp9MoGG8n7dZQ3pVNf1rp5Vm2Uwh/lx0FCV9
	H796rQypje3KcQ58AZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lssKm-00Fsy8-2y; Mon, 14 Jun 2021 19:33:20 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lssKg-00Fswx-Kc
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 19:33:15 +0000
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lssKf-000093-2L
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 19:33:13 +0000
Received: by mail-ed1-f69.google.com with SMTP id
 dd28-20020a056402313cb029038fc9850034so20868033edb.7
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Jun 2021 12:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sfJlofv21SpGZDidrB7CsJ8MDr7P7vCKWMcgZ/+7/iM=;
 b=bFxr6fKqtUy5FiqhBKUdvYN0Ah7lpi9Oi8ByJWwE9gjQhgOHXwM9HvfB1y1xFCoP8z
 71DtZxMy1VqPBeVb4xt1VoxvFWEmrhSzgg19Dsv3ornOke0cVt/F/uw99oCUsUBHIG8G
 3nsJtzB9954sXuy0KxgcgjJRuocnnhS+6yHDqG7/WZJ434L5kVRPfOQD2H/rmdXr0XSd
 1mjhe5sRqD5CGx/43vml+PF/Bk5rvpoh9rTqqt+GXEMzZDt0t9cwxDRs1eu7dJuMAYUJ
 Cti2yhb8HamXJchSg7CMZOvUXLFhdG7nAf3+pSbYZgJtXQtL/f99h7jgKE5jChCv+hAm
 XmaQ==
X-Gm-Message-State: AOAM533+/dCx70aW4sgCoRO6m8j4/fS8WABcWMJUoCCCq1JQo4ocLH8U
 yFLJ9JizhXhcH3v1LGltS/dfrytFCetOMlBYKl6k1PIRibSP0mmBcv0iLDvRKLCZK21TH5DtXi5
 ZRRUIq0vdDkTOkvG72qiPZGLhZwlBN6mbAgFfp9j1bq8xmfVtWKdS
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr19246389edt.194.1623699192597; 
 Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUwBAD6ChY0/D6TIhrxmWKERXF7uVQl6lBAKO7NbZ1+r6uaIe7co3RLS1phU3lsvHL6vuvqA==
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr19246378edt.194.1623699192513; 
 Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id gw7sm8029291ejb.5.2021.06.14.12.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 12:33:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 0/2] ARM/arm64: Samsung pull for v5.14, second set
Date: Mon, 14 Jun 2021 21:33:07 +0200
Message-ID: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_123314_701494_2F88FDB5 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210614193307.q3wHThzY6dX4V0GJifDIwRWjOUArcF1kxm7oYKyPBuA@z>

Hi Arnd and Olof,

For arm64 DTS I have only one patch so sending as is. Second pull request is
for defconfig changes.

Best regards,
Krzysztof


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
