Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683FBC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 14:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3666B60F94
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 14:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3666B60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/Yt+ClSiIt10Va0tfkboNVlApZ8PE1XyV65yc8kXZE=; b=3G4FSNP1avHXJF
	ih2UOVniyZG1oIkIqtfRh+6GaVbIKEWv7VVdwP74rJoJ5K1YwK6ENYebpnIKP+ew1sb02sKWj04DD
	EJ1T227thUT6At+qCSwPKMTqdlS8xwLd428h667DZMBkFvgdGOSj2n623sU/XzDuxYnOTq5rw+QWp
	uy4zaiQRIjy6UabDGev3m4wD/tPjVMatoBUkaFM1LTTmsWGMiJHAiu4mzCWQ1nuwBhcBs6jYlXdyn
	95bJmWJsgQgtpjJn2+PXcYanWhEs3IzLIEkWg5S1/f+5tkZvo1uiELXqV0/Zt3mulpqXUeeYzTUY7
	NW9HHg8vf5GCKjs7StXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHTs-006Gyr-LW; Wed, 04 Aug 2021 14:02:48 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHTo-006GxU-JI
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 14:02:46 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MqqLB-1mxpn13lGj-00mthl for <linux-arm-kernel@lists.infradead.org>; Wed, 04
 Aug 2021 16:02:42 +0200
Received: by mail-wr1-f41.google.com with SMTP id n12so2400863wrr.2
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 04 Aug 2021 07:02:42 -0700 (PDT)
X-Gm-Message-State: AOAM530/K4oiLqAZIXMuNigdejNELgjd786gjgj3hnJLStD4dmXu92P4
 SqPJdc4ksOI1wMgNT9ys/lPhKcZNouMqyAxlR0s=
X-Google-Smtp-Source: ABdhPJyUUeOCz/Sk2BVN80rO0xJi/O5dl+Q4BFErr7/7beTnL2rPo8aHa2QbQNXmTdgzOQJLehXZ+Akx9LGpcakr4fU=
X-Received: by 2002:adf:e107:: with SMTP id t7mr29024487wrz.165.1628085762592; 
 Wed, 04 Aug 2021 07:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210804084631.12934-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210804084631.12934-1-nicolas.ferre@microchip.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 Aug 2021 16:02:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Ru-qawBWtbmfJm-jiPpJTRJ9zSufXHNCZvxt1RCMFBA@mail.gmail.com>
Message-ID: <CAK8P3a1Ru-qawBWtbmfJm-jiPpJTRJ9zSufXHNCZvxt1RCMFBA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.15
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm-soc <arm@kernel.org>, 
 SoC Team <soc@kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Eugen Hristev <eugen.hristev@microchip.com>
X-Provags-ID: V03:K1:YgixR3iRkfVgQCspVX+rNGZeNkWfTgmeGiCgflu8lwBt2HM5jZK
 sGTSrPD7FVEon0uHHFZU8jupvllkiL1dBc/YvbgOnmj8SpNeutflyJYWOHHSuI+UYIeCJ67
 5iMYOvv6b933p0R8/QZKlvAIBZoWnZ9TUkPStpaTkUcYN1WGEXlDkjTPKyCU2YiVWh14IIM
 25JXNrQbX5i/zTNSNL4Iw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L/q++wbDyZ8=:K78uoC2Thq5+ixiOVwcvgv
 gtnHJ8qMw4zx30QJx+FcunXpPOdMVyGl8XEY60LOFbL1TwH/+Q8thqDgjCDygburacibuYSF6
 yYUywzkzVSNvXlHeSHelEAj+BDjXdU47lq2aiXotF2xWbklh6dPaKGnmDBS26HvM9Mz8td/LJ
 kLq480Xqu+Os0Ve6Qbg11aZWdB/xGD6WKxHJXJ0Tq1tRHLuvkcdp7H74kuQhZgzMajM17niGA
 mSxsSe3AKpvblbm49OLuljKpwUb2siEc5Q7BdCU3BaupUxsa6ZWgzcvw7r4swCPHCt+FOxgBQ
 76krJiaVWJSg6Z6O976cmEOmzDhzTYWpzK1W7TVFn/Cq14iHtcQzXAD/GoGbsabp0Vy0FinUX
 FhwqV9S5LiKPF+twaZwQiWXhfQP5CYxFHOgTISdIW5DzS7fgTTdZ8sKK6n7dDZPNs2pfM7+fu
 gzOB1hLTSNtuZDuuNBKF07WAhQkfNhZAY63MjKzN7D6B+0/+UFWZWp/Rss+R8F8YrlNBFBaB6
 q4mSEZ7RhfMIsqiSL3vLi31ex0PWFwIqfpfZ43hDW0jnPOFJgIFUl1Yb+ybORyuPeuDgsyvMS
 8AarUuFiQj5tfKGpGWcCZdmAQFyHRFm+zycQmHF2b48tJOvIk+by7HFI+EB/xl0utGtmgvJAm
 lWGUY01iaXbwpYyUHP0Poht8iYAnXpNI6QFs3ZQFreAOK+qAniNijWKCxUSkUnKTAOmhUOqGl
 QCg6Ra4Dll3AqnDV8XcfQ2FTUiTBUiXG1X2HCdsz0u/h590L6ilK9WeufNQwEUjeVcnb/cxxD
 C/aP5LLt8dRPOEFjfi+z2F9/wiiiiVS5ZP95iNuHRa2zMV3qkqWyK4NfXa+DuwSh1BeP2n+96
 hdYYejskx6lg4qIt7tBbIzmbtB7S8qL8V5pyuf1BRX25WICriYHzqR9j9Jx72zxnkFcsaAo6A
 408v6wMq0T0c6VVRK4ZCN5X8e4yt9/yGKX8LDWdHtEQjlQbtKPGYA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_070244_974700_5F9D9C2F 
X-CRM114-Status: GOOD (  12.90  )
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
Message-ID: <20210804140226.JLbpKwN2H8RB7oQYvTD84yaFt5kFhbN6gObMujt54Xk@z>

On Wed, Aug 4, 2021 at 10:46 AM <nicolas.ferre@microchip.com> wrote:
> AT91 defconfig for 5.15:
>
> - add defconfig entries for new SoC: SAMA7G5
>   - dedicated sama7_defconfig to match the needed peripherals and
>     dependencies

I feel this needs  better description in the changelog: Why do you need another
defconfig file in addition to the existing sama5_defconfig? Are they so
different that a single config is not a good fit for both?

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
