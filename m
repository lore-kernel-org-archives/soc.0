Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CE3C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:06:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07EA610FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07EA610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ob1O8kV6i+npUypxuTDQQui5Wf/jGyzrauaEy0yif4=; b=kxWBSjQk9zPXJwxNRbWZwqY+Z
	IVAURCc4dH0b1apSK9reK9hnm59NYnelox7LnfzsdjWQM7Sc379ZVYaVw8sm318WCKhKkeT2PO0e8
	glSeEiphn38wIWYtsY4N2HxhFhda8FQb5/G1ur6o/sgH3Nl8d7StlysFpOZQl3UBCFmSaEn3W9eTg
	C9c0Fg2QowQUkryRhtxI033V8+jeR01KTAMyszqEwkQzRJWkdUy69BrxMhn6S4ADUXvWwZlt2DD35
	8s35vb1/1ibWbwk9GzRx777LtCLOYfQB/HkKzBZgcsZAHQgTwVX411cM0yqO+wdlAYKCr5MW46/76
	/FPmwvGjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUato-0099kQ-R0; Thu, 08 Apr 2021 20:05:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUatj-0099ir-66
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 20:05:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C83F361107
 for <linux-arm-kernel@lists.infradead.org>;
 Thu,  8 Apr 2021 20:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617912300;
 bh=3kIIacXoQFBQy8yEj8Z2NRLgJ8azW9bsrjCf1Joem7A=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=JOa/NTqdU7G83fbavNfhl5BUoD+9rhqhNOMRnHnKj0KlmyV1Y2HpBXmiMjYd40uVj
 X8zd/0OyuXlYaEtlXOiKz6TZQm8L4Gdt6bnvKu15JkXmliSUUeUGJSKXFblRZe7Dhu
 Wh2DTZlA3F8OU7HXO44GzEsi2skgB1hZjnyLW4/4UxyWU1xciPv0T/jvvUVRX9odII
 06XHr9oQ074CrEH3XBSgnCMJg32EWtL0CX+tcicUDXGGrFuHJY4bWyM6ppUqlRa4WS
 ybUVuEDBM4K7wFe/quh/7lZHkZUaUSudKTA3VCzQVajk8rdZWOl7fLs3NbJgn2Zh5V
 PUb67pqABtR8w==
Received: by mail-ot1-f53.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so3526165otb.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 13:05:00 -0700 (PDT)
X-Gm-Message-State: AOAM532QP6Hurp1kRhEHVCl70cwkupF0/TeRuDjLX95Ygs7HuQulVXjv
 DyfQU5YS1wSyE0K+vM/ojl1gWXQga241E8ddpgs=
X-Google-Smtp-Source: ABdhPJyR9VAcVN1TEnQNSo+1kiW312GG1ZiLtvnYHlLiZhYuNzKfn7gEwt3o3axBkrbdG6jvGdU8YR5gyM8Y3YAg1b0=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr9533160otq.251.1617912300146; 
 Thu, 08 Apr 2021 13:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de>
 <YG8qIfFdY+As5tye@builder.lan>
In-Reply-To: <YG8qIfFdY+As5tye@builder.lan>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 8 Apr 2021 22:04:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
Message-ID: <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jack Pham <jackp@codeaurora.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Kevin Hilman <khilman@baylibre.com>, Rajendra Nayak <rnayak@codeaurora.org>, 
 Sandeep Maheswaram <sanm@codeaurora.org>, Robert Foss <robert.foss@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
 Andy Gross <agross@kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 satya priya <skakit@codeaurora.org>, Abhishek Kumar <kuabhs@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Matthias Kaehlcke <mka@chromium.org>, Shawn Guo <shawn.guo@linaro.org>, 
 Alexandru M Stan <amstan@chromium.org>, Maulik Shah <mkshah@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_210503_722333_FF637BAD 
X-CRM114-Status: GOOD (  14.97  )
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
Message-ID: <20210408200444._P6gu-q--dvLsrSxEooysvAHDVlyKTdLMFGOB5noGP4@z>

On Thu, Apr 8, 2021 at 6:06 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:
> > Maybe see if you can address these in a follow-up, to avoid regressions.
> >
>
> I'm about to send you a another set of pull requests with some more
> goodies that was lingering on the list. I will take a look to see if I
> can follow up on that with some fixes for above warnings - and take
> another look at incorporating dtbs_check in my workflow.

Ok, sounds good. As I mentioned, I'm also just learning how to use
dtbs_check properly. Unfortunately, it takes ages to run on a
non-parallel build,
and using 'make -j32' as I normally do means the output gets reordered
with every run.

It's probably ok if you figure out how to only run it for the files you
actually change in the Qualcomm tree.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
