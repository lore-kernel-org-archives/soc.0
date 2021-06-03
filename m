Return-Path: <SRS0=SrHh=K5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC66C47082
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jun 2021 08:09:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF16A613E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jun 2021 08:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF16A613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSpE+246M1BVbMYndUQGwAAWyiQFp5tvrNM0GHt79lA=; b=32P3gtdTqP0DC/
	yjr0W+Pl/o4hQJW3Z26rV/94AdLX6bSH0ghyBHnvuh5nwLgEoKIlhiWAIqVyOrbqm1sda90oq3/hP
	H83QA0uBpYGwPBbhvDwpcNC+l2NPtgcoSEGYeSzck6Ocg7tHIYmZXiRJBJAHj7E7UhrxoO6e5wkv0
	mmYbEigLtBoWQJkviobUZXgGOHuSl5oFck/7iEaT5z5NUiGCRAeST1EIsZx2Nv9+taWKzrql+clVh
	kYWo0niwUNL16QMcYKkBCudFwVgvCO8xC4GO459LQ7T1hdtC/sRjiuXmkRnsqlQQK6Bsd7FjhVzlC
	ZL40gmhUF6Esy4UrfrMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loiOX-007c2V-Cb; Thu, 03 Jun 2021 08:08:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loiOU-007c21-Sb; Thu, 03 Jun 2021 08:07:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41550613DA;
 Thu,  3 Jun 2021 08:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622707678;
 bh=ZCxBDzAOQDZIqm3ZxZ469NlDtwy+ENaqxWFnIF4XOtY=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=YozE3y6ApCVg3k/4PEGThwCDGna1C5plKG6UQw5G0Fq+/EYUkSGAodgauM+Mp+DpV
 jRYvo7BJ4svcWjOmgAr6cSKQ68khI1Eeq6CbI5rv37+sAeKliaQmkAY+spaiqg71Wz
 MuW2YJxtbAkJhz/TJ7yAkS4i1yS6MmsgLhUv8EuG5Y9ersuSUblCjVIidEAmOfeT2e
 19oS62o7rHtU6WdXIhzWkMHRIXa4PVGNnunvcPBJkmP/7Ul0TxTq9O2gapJ82fPObW
 5mC8NcvKf4Vi09RUt/TVWCfLJlE1wMlCtV9IEA5eX56NiSA4Dqtl07qCZ0N6pvnEfR
 mv7gRQoQ2g+xQ==
Message-ID: <ac7614eb0aa7888a886e16d427afcd1d773a21a0.camel@kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: broadcom: Add reference to RPi 400
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,  Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Date: Thu, 03 Jun 2021 10:07:52 +0200
In-Reply-To: <1622366775-5309-7-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-7-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_010758_971698_C4288814 
X-CRM114-Status: UNSURE (   7.24  )
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
Message-ID: <20210603080752.ZVdsyAXcIvFbCJ0a5BmTathhIizY7ihuuSHQpojPr7A@z>

On Sun, 2021-05-30 at 11:26 +0200, Stefan Wahren wrote:
> This adds a reference to the dts of the Raspberry Pi 400,
> so we don't need to maintain the content in arm64.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
