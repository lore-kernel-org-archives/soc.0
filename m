Return-Path: <SRS0=8Dbq=JQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD7FC433B4
	for <soc@archiver.kernel.org>; Mon, 19 Apr 2021 14:44:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6C25A61245; Mon, 19 Apr 2021 14:44:58 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79710611CE
	for <soc@kernel.org>; Mon, 19 Apr 2021 14:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79710611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mfpf7-1m0g623p7p-00gIbU for <soc@kernel.org>; Mon, 19 Apr 2021 16:44:55
 +0200
Received: by mail-wm1-f44.google.com with SMTP id n127so6564125wmb.5
        for <soc@kernel.org>; Mon, 19 Apr 2021 07:44:55 -0700 (PDT)
X-Gm-Message-State: AOAM531EJ9C1Vi+/lnAOwqzYKuqYGd0jjjHmavgx2NDO4dLt6rPWdhon
	2J8IwpehGWskm6VwBXx2sj38Ca/JXBVStHdvYlQ=
X-Google-Smtp-Source: ABdhPJw7qcfKMobGVenQr0RkHIs+d3bPN79IEwmrNiIriuBPJAdh6tyhZljPRwl19JD0XPtw75uuw7csDyaRPzvncLs=
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr21646797wmj.120.1618843495594;
 Mon, 19 Apr 2021 07:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
In-Reply-To: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 19 Apr 2021 16:44:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
Message-ID: <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:yxCHuI5L9pzjKinnW5ZoTrFWC57MW/qeY5+j+9ZvPDf269hWvMY
 GYPReBpmIhOH+DUSxNIZL+uzCGZtBJtycpZzHTPGmBNNV0ZlHICE2+i6z+5a8eIo7Ug5dkz
 CH7sZkCtsVRfCo9ED81Db3pOMknihWwUC5Xer4B7bZjRIKK8MbA1iMVNV4RDeEKQGNZ+aah
 k5YrWU0x/B1AEpTNeigPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s+cPCeTQ0vo=:otw6bV13f+58h/Pr2wmlN0
 JYti3fw7Y4iU6D+iT5JjMygwTyJGXgZr187OCcuy28SYHHBJuOEhQnUwuENDBJsLv8rPSrW6X
 dWMWEtYQ8gO3Ms+Siiru7tlMFprxD6xPGYf4RXE8Qg6di4qqs13qSTm1LnlJdtz34WDCI71e8
 pGS8or3oAx01KUExJrkB+fuoDA9xgPgWn4AARvSI0KexlQ75hzy/68K/bylTkOwlalJqMFbIL
 Gf3ZEGQClTyosSQYZ589tf8cH8FRFLDWiv05IhHrag3lN9/AGajr50F7AKsX9OB/FD0yEykzl
 vi/Fjxvz9/F3s9ots2MYAU3S7U/ZsIdoP7fNuIxuiAKoh19VdobJ2FWnoP+fNOxXJxSZthSIN
 slsH/N8ooH8AoysA0kRzF0XHcK84Ve8LeKXg6TGIJBbazda/3Aqbv+vF6Jx3+PpA0HJb3XhUB
 184KEKjwKpG/rvdKKI/BkuCwdcqLTWdM0QDwRBuSmQ7n+XX7k3IN91kQqXCtnrYWaS78aNGAA
 5b6kGxL0TRIkG/8nOo8iu//j2BpkvbUo0CQVyzMnAnwOmW7nk244MffRf8aWcOH48py07FbnI
 Ffb8lDnDDkpZCn8StIie8lgRyXHVTpiI/LPu/1Kc6FgJX7BCf6TPBGtLOR2ydH6L7rxSXYUqg
 Obqg=

On Fri, Apr 16, 2021 at 5:27 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Soc maintainers,
>
> Here are some fixes for the changes that have already been merged for v5.13.
>
> I also merged some changes that came in later. If you would prefer to
> not take them then I can send a pull with just the fixes.
>
> The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
>
> for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:

Hi Joel,

something about this pull request doesn't add up, and 'b4' refuses
to pull it since the 'since commit f0145db2' and 'up to f0145db2'
references refer to the same commit.

I assume this is just a copy-paste error on your end, but it would
be nice if you could double-check and resend the pull request
based on the ee33e2fb3d70 commit that I merged.

       Arnd
