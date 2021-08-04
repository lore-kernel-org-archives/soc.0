Return-Path: <SRS0=XHAu=M3=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74574C4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 13:56:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5A32960EE5; Wed,  4 Aug 2021 13:56:07 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A94D5601FD;
	Wed,  4 Aug 2021 13:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A94D5601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mx0VH-1n3tzZ14ih-00yQQQ; Wed, 04 Aug 2021 15:51:02 +0200
Received: by mail-wm1-f45.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso3983466wmg.4;
        Wed, 04 Aug 2021 06:51:02 -0700 (PDT)
X-Gm-Message-State: AOAM533uraUyX7OuRgP9oULhXPkOswJ1SYcofH6MOxs56/6FTCDhjdIj
	DwEsX0fIPKuMjKWHVxBOL42A2CO3sEGesvepHXA=
X-Google-Smtp-Source: ABdhPJyNFXrQChPOLZS9aAXYYL1omRQ7dj4KugUgr5B6iGIyUO+NAtViqzCeM3ydmA0f6eM1ScWfqCiaf+g9Xa3Yeew=
X-Received: by 2002:a05:600c:414b:: with SMTP id h11mr9756314wmm.120.1628085061870;
 Wed, 04 Aug 2021 06:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210803124506.23365-1-patrice.chotard@foss.st.com>
In-Reply-To: <20210803124506.23365-1-patrice.chotard@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 Aug 2021 15:50:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a06_vUXghtvp4jTMEc4jV7RW8XmbUmgfrsoH_BSZ+awJQ@mail.gmail.com>
Message-ID: <CAK8P3a06_vUXghtvp4jTMEc4jV7RW8XmbUmgfrsoH_BSZ+awJQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: dts: sti: remove clk_ignore_unused from bootargs
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+w3/FIsKOssB5sM1NGRAJ/61T6MIG4Q3BDsfh/c/uno8agjcNMI
 hERJWAO4NZG8I6/zd0kcniM7MUMck2olhWcHLKxnXPJ3r8+4Hj4Q3PB1ESWWBVInpPofexs
 ysbVAnIFkWPU3D7jbhHN9Ag3YhoFjfth6gAX/Twkh+56uFksA8zofAWKaYMpFTz4OEkQ00L
 B0Cg9s1G+inUop0Qd3nhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vbo/hKrXWbg=:du3iIHqMEZjamv0C3fnb02
 GNon152825T/6UH3sQHgdm0UMwXIVCSOSfvb80edHbEdocoE67WOOPzTPvBs2VqXZJBF2ukzc
 KOX61VHdGzn7HocQ4ocSuGJDGoMf+AT4SRhbrQKKxx1plpY/6qr0VpjV7xvl9wRDlFmV/Av8G
 329swtn1ODqV1Rt2mxGtqDqYLlC5SLRkC+7FCiYMPjNeNshBAMdQCD0nDDb134+UHSju4Gup2
 weySutZK9IRyvo5EPnw2cJplFAb96xWRZCMEHOYleKcEn42NmJF//wL7K1xE0txI2oXoYTYiw
 vrGItp0elbW6iqhpEXd9kfmIZCKXHBd4Z7WJu7XM4LaUAolgWMwEev3NR0sv0WoSOiB6tXmeH
 1sZkJmFEVRAuNUYKKIz43unJiTpKdMuS47RubMCMiJgImXkY7n/BjybSmukol/0atbOOPg9it
 mT7vsQq8WB6mXvL0H8dOXGhhiQzzQneKabt3nQ8Jpb5PgiGNjyd+VW2H/m9pf1r/Bu4HAFWmD
 F2QR2m+EgD0d4NLuytAPoEz183xA7WXFxbtziVaPXNK5S8oeL4HU/uFSe+a/lXB+LXBBsas1E
 PLcPezrpEBvehdVJ4HY+GJZH/SD0FKNrJAJj0Bird/SvZzkaYe+rTBNxg02OJvp7EMwFoL6GY
 kKmekMqw+T57Y6uuZCs1RPHiiITDrB2ZdaUjcyJVO+lMN1rOMsvHTAwZXwOs5X7rhX4euZ/vk
 o2XmY/D3N2obQWnV7WGU9KpjttxZFfX+ototqFzw9E01eybyBYdH+UIgeodBOwNcI+RkYMBX2
 jCTqzifRngd4i1bhhMmanJeHrzsHKekxvdEG+Gg4cDyQS/+g3w5QYoPOFBfBZEi4bxsNTgpsI
 oIDGndPKMJk5sTxBqNBxUkAoQp1LDanyTgxbyLtpj+puuk6urf0aIc2CmlNIc8HIjGA2hTvyu
 h/Sy2ONnJccgmxuCKgrG+bKyfRIG/mUYR0fxBkEPkDS+nMtcY++cd
Message-ID: <20210804135045.IbMwL8J8u6XyokJ0_dnb0jg9h4lagr00aNb5ypHfTqI@z>

On Tue, Aug 3, 2021 at 2:45 PM <patrice.chotard@foss.st.com> wrote:
>
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Remove clk_ignore_unused from bootargs from STi boards DT.

The patches look good to me, but I'm not sure what you expect me to do
here, as you have added soc@kernel.org to Cc:, and other addresses to To:

I have dropped them from patchwork for the moment. When you want
them to be applied to the soc tree, please resend or send a pull request
to:soc@kernel.org, until then, please leave out that address so it does
not get into patchwork.

      Arnd
