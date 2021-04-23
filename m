Return-Path: <SRS0=UfjI=JU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D9DC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 13:50:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B0561458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 13:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B0561458
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PwVrpjCfcG2yZe5erUSU8CkLigc/rjffRn+0V8yrJVA=; b=H+/tJh7VbKo8EoOCcGEzUoJbA
	ySOjS27uap+S5yTuy/UmRHY2crTnKGDf0MKqqXv0ifz5D9775hCPNrpORvY6liYNCfqsjqiH+mc0s
	rhVIEg4qwbmTUakymF/lhj1E786of/JMnY9i6ZLeIMIgwEoxfAoaroOi8gd/8y8QA63csyysOHyo2
	kqv9a0ET9jAZE+0mpJtCRdVWyRpZKhNvMnBZvbABI7IShkqnrS+l2vlamfpSTTGAkwLwXzL7nI1ub
	nUL7NXQ7R8+iyso9BYF5pSYd4VVb8Ser9or+CGXuF4Y6cueR01DQz+Ta2o9vnBWjmNPLbmSa07aQN
	lfVdrXFdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZwAJ-001bbE-9S; Fri, 23 Apr 2021 13:48:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZwAF-001bat-TA
 for linux-arm-kernel@desiato.infradead.org; Fri, 23 Apr 2021 13:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OhiJ1/902DSxK4BLS209FxDdburmr0OsloLQm8xqBBc=; b=Ix0HZhQ0Q0NREubMxHT+yDGJ/V
 u+7gYFWrGxWGIlA37e1ntNng0KG57vjaDs4Qtuvu2nmNnTjex3r8h6dTio++dXGvBPE4UQyWD1UdS
 1YyW5hAtriWuM6UEkTZbQKh+oiOE7zAHXhs0Ik9D3Xm2LH8oZtF8ThrlCoSqMUcZbi5GavunntRKZ
 iACAsMf9Z2xHL8QLEY2XFrfm8zNT/Ve/6QT7MmBiAF6aWDbIUzKXw1NnajS8nxHKDmEBo0j0ZAmi2
 w5ILkcSOQflTNfLZYNMZqOmXG5CZODcX5Vx4OhHO7MyPabLRennlGCuuDkqv9ieU5Ra+ax5qzd+pC
 F1CCkrxQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZwAD-00ERy6-HP
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Apr 2021 13:48:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0277A613CC
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Apr 2021 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619185689;
 bh=zLi5x1sC9WOXj9HAtVI7DhaxVPxmTPooKmLPsEGZs8A=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=W4hLBGON1IFbdbBYCl0CCE02i3Wttdb+QibmfopVnK+wlvFJ8rlPuG+xW4YZRwdqm
 PS4DsqDFadu+sDrln3x0+ytYrIBIN1iHjnTsZene0LnS0HHGL0O89+TVorIHooCUYV
 nhV77JSumyt5F97SJKhR1MGyJl+uSfyQxqQ3dkYzz7i5lIt6NVQ0yvn/fi1mBo6Uz1
 XdtbfiyqGx7yBE6L6ffNcHcwEMsqdtpnJL8uf+71nBBXqnXlNF+tQCPs8BYhWpTGOe
 oor7bd4zg/tC/APMSBJp8JptK4Xv22exHmiK3YIUNzExw/pHkCFJbkQuRd01MD8Mf0
 /ZhCSH1QVfXEQ==
Received: by mail-wm1-f43.google.com with SMTP id
 p10-20020a1c544a0000b02901387e17700fso1276424wmi.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Apr 2021 06:48:08 -0700 (PDT)
X-Gm-Message-State: AOAM533PTx3luJ3GEHOyneREh5yup7pe4Pevgbi+v93VodR3bLc5w5uX
 zoqSdw8J4VWLW1WASH2VMEwvajX7XaThkRGM1CY=
X-Google-Smtp-Source: ABdhPJygoTRm8fteVdnqwcXtTEkbSmTTyzL+scFg0e8teY+/geuDsF37+mNNxFz9YcRndpDzH5TeJljHATMDcjJUPvk=
X-Received: by 2002:a7b:c344:: with SMTP id l4mr5605549wmj.120.1619185687518; 
 Fri, 23 Apr 2021 06:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210422140945.4131092-1-daniel@0x0f.com>
 <20210422140945.4131092-2-daniel@0x0f.com>
In-Reply-To: <20210422140945.4131092-2-daniel@0x0f.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Apr 2021 15:47:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3fkjy2YYwhmsFQt-MSyOh=1zf1wqzQB7usjsHbUBWdtQ@mail.gmail.com>
Message-ID: <CAK8P3a3fkjy2YYwhmsFQt-MSyOh=1zf1wqzQB7usjsHbUBWdtQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] ARM: mstar: Add header with macros for RIU
 register access
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Willy Tarreau <w@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_064809_628736_5B89038A 
X-CRM114-Status: GOOD (  10.80  )
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
Message-ID: <20210423134744.4EXZwiVlQNDolC6KBCoeh60Nedj1vnLNOMieMSP-YFs@z>

On Thu, Apr 22, 2021 at 4:11 PM Daniel Palmer <daniel@0x0f.com> wrote:

> +
> +#include <linux/io.h>
> +
> +static inline u32 riu_readl(__iomem void *base, unsigned int offset)

The __iomem token comes after the type, so this should be 'void __iomem *'.

> +       return readw_relaxed(reg + 4) << 16 | readw_relaxed(reg);

This should probably be using 'readw' instead of 'readw_relaxed'. If you
absolutely need to use one of the relaxed accessors somewhere,
better add both sets and make sure drivers use the non-relaxed version
by default.

Maybe both types of accessors can be in a single header.

     Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
