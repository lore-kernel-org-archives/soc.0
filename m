Return-Path: <SRS0=lBpp=GD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB4CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Dec 2020 12:51:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C804B223E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Dec 2020 12:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C804B223E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jamieiles.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9aIZ3ERGeK2MmyAqah/+sBJyb/rcQZaCxsJ539uxTIc=; b=CDwrPnXGyUj0T2V2l/foX8D10
	DBezYLPcf6bssUaDJv9X999gY/X1hcQhykosrrVkFwFBercU7ivbjPR4FqLezXYt4IraQOgxcOlBk
	KRHGSoGwZ2YIxNMosqa9/z3SWBU5edVRrk1gfv74dlVGhsb1s8A5YZX5e+stYl+iHoOAMIsCHhBch
	NDdTCkxHZblsByrJo2Yjz6lOexcSezIgcoJarV/RDqAb+JEXkUzneClZ257EhGqNniCXjrHforAlU
	d3HhArGUTp6gQhwS7FTNWsbmtolnuhzZlgNgmlLOaOhWVnXTgCVyo0cL55UH6c/OTwI1R3vQy95rF
	H9J93yjvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuxOs-0004xi-6L; Thu, 31 Dec 2020 12:49:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuxOp-0004wt-2Y
 for linux-arm-kernel@lists.infradead.org; Thu, 31 Dec 2020 12:49:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id a6so7267604wmc.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 31 Dec 2020 04:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jamieiles-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+u96/FdXtTHmr5sq3JveWFw2+/26Jf5HarPYw8gvYCs=;
 b=LRifIyWKZ8eOFZxIGtpU/YPzV43QhXZop2mhbgMeq2j1tJmIEss1L8YfY/wZQzkb+H
 HyhZWcw1B5hI4ZkYVss8CObpO9qKeGPyWTH978tGg37pSCPJlzs1ea0ezfqY8XXyFH16
 K4a3UaO++OmVgGpJuk4WWwyTixpmUWvYecKa6b5FQrENGKFrNQDBhKL3bdiFtK32UMpm
 vi/NjDURR80NlUYY6siwN7Pxwpz6IlZz3ZSh92QiIeiGvVkMKMdjh9tjRqr1+ma3CTBy
 8UFB1cZxKQ8Lma3mRhL2AYlzFeESkAkNbonYqHHJxltr85w5Zr5wQu6YkSmOezjZYzF0
 4uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+u96/FdXtTHmr5sq3JveWFw2+/26Jf5HarPYw8gvYCs=;
 b=T7sXYayB+zJoa35WXxy5R4MzyFjjjCYKQVyKgWzMvErj97daXvjOdf44r3lbgswETV
 hLrmEyyO/Bg30rz3xRWv4T+Ak0G1Lt8g4fxAi/nbH+cSRHmBhD16oPnHqIoNHwhce2c6
 zGG8MfV8Hbz/AL+91Yqz7Du5snk18zvi9XUsI+cAFwBznWy91s/Z9Z8aEoOm5l/0gJPF
 wxUtUdLAYl+GWX3ryrfM5VUGkPTTTJV3N+K59x9uND3XFzuCCuwNpNLYOhMP3tFi/0z/
 pJM5zJQwmf63uQ//OL5VBAhlST3vj4oBDVLefSwhJiGoQBHKKggOppxDus1W/l5DARl2
 7GIg==
X-Gm-Message-State: AOAM532QjF7GKbzOrBCi/JjcsmC7faW94V9eG0swYy9RfDV6xNR1I0J+
 AXt2TSChD/MjuKNK+UBHdgIOcwO/8hDUMw==
X-Google-Smtp-Source: ABdhPJyaaWOCxYGSn5WfpQxWYXqZdpY4FkOhFAEAmVOwUHvAIspHxZt2IHTzFJ/vdcbAAwb8EbljbA==
X-Received: by 2002:a1c:ba07:: with SMTP id k7mr11943033wmf.34.1609418987858; 
 Thu, 31 Dec 2020 04:49:47 -0800 (PST)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id h15sm68233268wru.4.2020.12.31.04.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 04:49:46 -0800 (PST)
Date: Thu, 31 Dec 2020 12:49:46 +0000
From: Jamie Iles <jamie@jamieiles.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ARM: picoxcell: fix missing interrupt-parent properties
Message-ID: <20201231124946.GA2918779@willow>
References: <20201230152010.3914962-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230152010.3914962-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201231_074951_235579_2BD367D1 
X-CRM114-Status: GOOD (  16.07  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201231124946._bRx4BzrpKk7Ef_43h89zBRrCAz7Lr_qfCuz_rW2V_k@z>

Hi Arnd,

On Wed, Dec 30, 2020 at 04:20:05PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> dtc points out that the interrupts for some devices are not parsable:
> 
> picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_property): /paxi/gem@30000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_property): /paxi/dmac@40000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_property): /paxi/dmac@50000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent
> 
> There are two VIC instances, so it's not clear which one needs to be
> used. I found the BSP sources that reference VIC0, so use that:
> 
> https://github.com/r1mikey/meta-picoxcell/blob/master/recipes-kernel/linux/linux-picochip-3.0/0001-picoxcell-support-for-Picochip-picoXcell-SoC.patch
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Rob has a series to remove Picoxcell as there's no active development on 
this anymore and Intel have stopped producing the chips.

Thanks,

Jamie

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
