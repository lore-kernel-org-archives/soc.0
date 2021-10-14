Return-Path: <SRS0=jErW=PC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2A4C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Oct 2021 00:55:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42179610E8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Oct 2021 00:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42179610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ub7EpqOi+wwK7aCl8rlfTn1eaeWgMHlZVjk/YnbFTpY=; b=2s3TKQSW7CjDhH
	s2gbkhEs3HVG7OqGJs318DVVIQa80UBGa/tz7WACQySSkzQmyTBgYge+BzbuTJOTREg4xQG37hAFm
	lYbX6w7eGZfu8X2mD9ydADEkT0Zbc40JEdABXyA4vbVgvLxFW5Me/LMmYQ9ZpsJfySWbzGCDMN1gy
	NK3JA2GK5250e2O8FphgQAriUsEg1pkRA87gnuZgJgsAmOCxCQquvFEhtXt84ZRgoLVTgzTzYLHUG
	0sDwTADJ+5WOCJ1QOuhFqpbKfz8y1NZ+uuDN67AGoWwzdCbBDem5vchmjk99Ub6JGXfT5sNHdA0+D
	xEvJLc9DrddTw0/e8OJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1map07-0019Gq-VZ; Thu, 14 Oct 2021 00:53:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1map04-0019GK-GI
 for linux-arm-kernel@lists.infradead.org; Thu, 14 Oct 2021 00:53:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC61061181
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 14 Oct 2021 00:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634172815;
 bh=3KPseUxRNqX7s5JgcKYolFJTKXSJAtZzfaDv0lxJBP8=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=AhEsh3JJvcMjZFBhZvn/lvZeLjQk/sbi09VXw5sPo91c0861Z9Aw6tmhVY//UAWE0
 W6LwWEQIcdKFWthsfp2S2U9CIZ9NizH5SMzfRF9vo1tRD7m51+NzJ5FHzNg3eXkSjX
 xtgSyt1z+gOZg78EWcoZ49nLJsUJ6oKPpsw8s8LCeRS8c9gj641IPO81+nxbz3jae8
 PZmjmeNLqAGDE0Vf1OaUtFkLWgTVxquZTfVqqyY67x4aB354nbjTWatQmWDh5nnVJu
 ypuCVWGIrsbzutu7NQkmZ2wDxEpujgIL3gZG4e/acJKzXq4CL+7RTFHBDM/Bm9abqa
 xVtv7RLH/oPmQ==
Received: by mail-ed1-f45.google.com with SMTP id a25so17382222edx.8
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 17:53:35 -0700 (PDT)
X-Gm-Message-State: AOAM532D4kjidgJ+Uijz8IHRhA1Q0DgOyOeb0vMqktDv5iReRIjbv7W6
 gxhOhKZSP5HjJnXWAxLEOxyotiicgPwxMQFtsA==
X-Google-Smtp-Source: ABdhPJzmdBxqGuN5Y6dvnAmkJ+FPUu9AdVj2ElG+Da9w19ioQt2w4/WNtq9K9kc99aoUc0NmAZWyg7kd9vPJF9egBPY=
X-Received: by 2002:a17:906:5a47:: with SMTP id
 my7mr157436ejc.128.1634172814079; 
 Wed, 13 Oct 2021 17:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org>
In-Reply-To: <20211013143810.2101838-1-arnd@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 13 Oct 2021 19:53:22 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
Message-ID: <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Liviu Dudau <liviu.dudau@arm.com>, SoC Team <soc@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_175336_584543_6649AAB1 
X-CRM114-Status: GOOD (  13.04  )
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
Message-ID: <20211014005322.UKmTWDI2VngfYgBKGmJObzYakZMzNfpqGSao9HCsHsw@z>

On Wed, Oct 13, 2021 at 9:38 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> dtc now warns for the LED nodes on the versatile-ab board:
>
> versatile-ab.dts:126.12-132.5: Warning (unit_address_format): /core-module@10000000/led@08.7: unit name should not have leading 0s
> versatile-ab-ib2.dts:17.12-24.5: Warning (unit_address_format): /syscon@27000000/led@00.4: unit name should not have leading 0s
>
> Remove the extra zeroes.
>
> Fixes: 07ebfa59b9db ("ARM: versatile: add the syscon LEDs to the DT")
> Fixes: 7fbe5f7ff267 ("ARM: dts: Add Versatile IB2 device tree")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/arm-realview-eb.dtsi    | 18 +++++++++---------
>  arch/arm/boot/dts/arm-realview-pb1176.dts | 18 +++++++++---------
>  arch/arm/boot/dts/arm-realview-pb11mp.dts | 18 +++++++++---------
>  arch/arm/boot/dts/arm-realview-pbx.dtsi   | 18 +++++++++---------
>  arch/arm/boot/dts/versatile-ab-ib2.dts    |  2 +-
>  arch/arm/boot/dts/versatile-ab.dts        | 16 ++++++++--------
>  6 files changed, 45 insertions(+), 45 deletions(-)

Please apply these instead:
https://lore.kernel.org/all/20210913192816.1225025-7-robh@kernel.org/
https://lore.kernel.org/all/20210913192816.1225025-8-robh@kernel.org/

There's also also these fixes that I sent:
https://lore.kernel.org/all/20210928192143.1841497-1-robh@kernel.org/
https://lore.kernel.org/all/20210928192210.1842377-1-robh@kernel.org/
https://lore.kernel.org/all/20210928192123.1840842-1-robh@kernel.org/
https://lore.kernel.org/all/20210928191759.1835325-1-robh@kernel.org/

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
