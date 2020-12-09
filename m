Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A0AC4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 06:41:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 48E5823BAE; Wed,  9 Dec 2020 06:41:59 +0000 (UTC)
X-Gm-Message-State: AOAM533liCKkRW0v4qmpGgCJ0WBoArxmfuddJu4d/b1063i/ywLeidiu
	XCgBDYIOAadFxrHUbrbm62xMud0MgWzNR+bVvfA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607496119;
	bh=ES+jHxWzAcEixUmgxWWwRfBScxOikH27C+yNiQXbzAE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KgV7/ht2s4oo+u4hXz+67bgiYN/Mf/lHTv8Lv5/heO2hQQJ5eYY+wu7hfE0CzJfTF
	 dQd2h1bUw5goMq+2GjUbNI85MV0ghm3pO+Jb5aSqZuGNuQsPVHHqZ/Q4iv+DZf3MUV
	 haw7H0F0uHqbozE1u6+4sO5GaukCKMmPJVoFtkgMRDucOQI9fF0UWGXMNWbgcjobUh
	 Q2cmEsc9K90cUNkWrBAnn316aFQsVI51i/sstkku3xkzUydxiHoOfgeYLe+IGS8e6W
	 aq6fr47hlXNoGGewgdRlR5/NS9ngRtXkHQtkly9Z6hVlQ6Pz8cO/hcFt52/yGHVUGM
	 AsWlpXn51PksA==
X-Google-Smtp-Source: ABdhPJxYLmHvoPig9koxxVNiAtFkVWeACs1tzrWPAudrWny6ydXo3iY7W4TLkUx0lOr6DV2U0gBBdnbUfasML3/M5l8=
X-Received: by 2002:aca:bd0b:: with SMTP id n11mr738232oif.11.1607496118436;
 Tue, 08 Dec 2020 22:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com> <CACPK8XePhJj8HzbLB4QgJQCjTuH_kPq=sWyOhdcGPmptqD6Aqw@mail.gmail.com>
In-Reply-To: <CACPK8XePhJj8HzbLB4QgJQCjTuH_kPq=sWyOhdcGPmptqD6Aqw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 07:41:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0jPEjXnqGpeQ=A0Pd0esX+k4EHgbrGr+NAQAx1vO9Q7w@mail.gmail.com>
Message-ID: <CAK8P3a0jPEjXnqGpeQ=A0Pd0esX+k4EHgbrGr+NAQAx1vO9Q7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] misc: Add clock control logic into Aspeed LPC
 SNOOP driver
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: John Wang <wangzhiqiang.bj@bytedance.com>, SoC Team <soc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, xuxiaohan@bytedance.com, =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>, 
	Jae Hyun Yoo <jae.hyun.yoo@intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>, 
	Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, 
	Robert Lippert <rlippert@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Benjamin Fair <benjaminfair@google.com>, 
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 3:17 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 8 Dec 2020 at 09:17, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
> >
> > From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> >
> > If LPC SNOOP driver is registered ahead of lpc-ctrl module, LPC
> > SNOOP block will be enabled without heart beating of LCLK until
> > lpc-ctrl enables the LCLK. This issue causes improper handling on
> > host interrupts when the host sends interrupt in that time frame.
> > Then kernel eventually forcibly disables the interrupt with
> > dumping stack and printing a 'nobody cared this irq' message out.
> >
> > To prevent this issue, all LPC sub-nodes should enable LCLK
> > individually so this patch adds clock control logic into the LPC
> > SNOOP driver.
> >
> > Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc
> > chardev")
> >
> > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> > Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> Arnd, can you merge this for v5.11, or would you prefer me to do a pull request?
>
> The device tree patch from this series also needs to be added.

Sure, please forward the patches to soc@kernel.org so I can
grab them from patchwork.

      Arnd
