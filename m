Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550EFC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 06:43:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E810023B23
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 06:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E810023B23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=doXVJS1sd83QTjvN2VAT3pQ+UX9UdNrSmON+M48sePw=; b=LJjV3gWaUbFVF50yka5b643iC
	TanHOZGkWaZBM0CeQ8jNFEytSVz6OLtNb7WKrj1Jb99kV0K6Oh+99Lh/OMoc/wwayTV8eGxeAq4Of
	jk/Y76wjKTNBqwPLb3PzFMlS5ZUEpdsURDAP33077kiiaOm0G5DFCngiVwdaxBPGyd3DwEoj6PLax
	I/nwYy3U2uiD96xvPNMVP9Mw0te0UUIPdR+/2dIdRWDnHUGNOCyElOTykwdvSOhZPn/YrZKhyEu6Q
	lGPQ0IQmzeBKllqQtGYy3gBleym6DlJlw9tYH+Ok/bJhkyJi8LPKVB4uO74AcNm4UwEg7nLLyQ8UG
	+gllp2UTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmtAp-0007Yp-Tn; Wed, 09 Dec 2020 06:42:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmtAm-0007YC-T6
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 06:42:01 +0000
X-Gm-Message-State: AOAM532ngDCPunkzuNsKtS5oGLY0Pgo7bqV4hupOkOBcPtxyHL2JvYoX
 1YlJ85v5JIXtYKxbMf7f6vzW7CXc3s0WqDvWcv0=
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
References: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
 <CACPK8XePhJj8HzbLB4QgJQCjTuH_kPq=sWyOhdcGPmptqD6Aqw@mail.gmail.com>
In-Reply-To: <CACPK8XePhJj8HzbLB4QgJQCjTuH_kPq=sWyOhdcGPmptqD6Aqw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 07:41:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0jPEjXnqGpeQ=A0Pd0esX+k4EHgbrGr+NAQAx1vO9Q7w@mail.gmail.com>
Message-ID: <CAK8P3a0jPEjXnqGpeQ=A0Pd0esX+k4EHgbrGr+NAQAx1vO9Q7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] misc: Add clock control logic into Aspeed LPC
 SNOOP driver
To: Joel Stanley <joel@jms.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_014201_077627_29C735E8 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: Robert Lippert <rlippert@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 open list <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>,
 John Wang <wangzhiqiang.bj@bytedance.com>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>, Patrick Venture <venture@google.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 xuxiaohan@bytedance.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209064141.jei649RFt41KXO9AHBYxmqBXQLRZNaIoXfXeVl5GiEw@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
