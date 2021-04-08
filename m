Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6C1C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 23:07:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6053E61008
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 23:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6053E61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PD31e2S9X3Oy2Ex05e/ZKsczij2zov9P7lXeSzoF2yg=; b=Vf9Acnqq1xBXKrD+ridAKUnRf
	aMxWDO4xZrc6AInWj/VYxHAsWDkNmEJ5VMtl41kaKbIdCVU9uTuyDYdXZ5tLwMVefBq2TdlI9baKV
	O1JKYU34ETPrO3KlHrpPxiE1PbO16Gz9FmxrPToYRKXvSh0bymwZNTuj5npaJcJeXMpoXElxTmua2
	iV8O7MHWeYi4O4NWCzpwRb+E8h3ru1h33Zi/xGgjRDSYDBEl00ryq+MBiVQPBVYhNiDukujFkrUVc
	2YJVvAgReQWJMpurp1LVFFaDddjy3zyVeC2V6p/NyWaMfM6AM2qjW78mr4IGxOsqduglLtd4l3iLb
	tSR9jomnw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUdiT-009QXK-Nt; Thu, 08 Apr 2021 23:05:37 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUdiM-009QWW-49
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 23:05:32 +0000
Received: by mail-oo1-xc35.google.com with SMTP id
 n12-20020a4ad12c0000b02901b63e7bc1b4so901636oor.5
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 16:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fIJgPmsymRSbpAq065huLv5F9qsBv+0+1g6TYUpN05I=;
 b=jVGst8yP+aXkUmXUvTfLCylBlxO5+0c1cLYJz8HXDAMObgH+8PeUFm6p/kkIO2pZI8
 FGGcsAgojuRqkVmpgTUh8kxaSTvcorn9xjwQQogdWJgiIE9mJu9M7uEjYNTFxgSbNtOJ
 yAo8zuZmAQ4n6Gm34vqYTZRRyoDjN40TLF1YD0SZ40uGqb1APBGDGqXexISpEwyQrhNo
 hsorUmXOixtOdON0WoNKPYLIX0zG2bXpLsI/OKT3KqZUCLU7ZCcS8SvW18/0YpUZCRsc
 Oxw4fuWJSrabcK1yINRXoBNiqQ00zTmBKzvl/LPpvxbWZ1lHmwjM2lj5XWUtbiXnNmIc
 V4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fIJgPmsymRSbpAq065huLv5F9qsBv+0+1g6TYUpN05I=;
 b=hCaBz9GvlJPtgM/h0OPNo58lKtIAfweQO0W7NindMv+LbHMd56rAKDhWaMHdd60kQ7
 Hp7JU11V9qTNOW6PcwQ4GERiDM1PYsyuCY95RMY9LiDFNYOq/83dtBFaVY0zD6+NF4Bc
 w0UgkGoNtm27bWwSh7K43cSiPi71MYsnz1Sg+DULA+n3rIUKkNXtcGMQnRKknLICRaSw
 /fnaOmiDyI65NW5EErxGRFfch0YeTd3BY0XTUQdO6QqCZIw7+6H1GDNPXjnelbACwt04
 2wQlzWTKQxHWm9hcWodqpWfLmhAelUJF1iVJs2qQAyfrL86fGWDeSSLdL+SEAVcvS0Yz
 7FGQ==
X-Gm-Message-State: AOAM5300JjDSLVx9JT2XikQ0QTyGl7kJCUbjXGQXt8F1j6eK+ghGqDmt
 EyS4KuOTRkv+TtNGWzuiPaNqaw==
X-Google-Smtp-Source: ABdhPJxRzyAgaAYEq32zzNis2OIL568aSsy9PaGGntU7HxN3A33+OInIy5jLCmOjuHtchT30o8XzHQ==
X-Received: by 2002:a4a:8247:: with SMTP id t7mr9504066oog.53.1617923128816;
 Thu, 08 Apr 2021 16:05:28 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x3sm195405oif.22.2021.04.08.16.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 16:05:28 -0700 (PDT)
Date: Thu, 8 Apr 2021 18:05:22 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jack Pham <jackp@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Sandeep Maheswaram <sanm@codeaurora.org>,
 Robert Foss <robert.foss@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
 Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 satya priya <skakit@codeaurora.org>, Abhishek Kumar <kuabhs@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, Shawn Guo <shawn.guo@linaro.org>,
 Alexandru M Stan <amstan@chromium.org>, Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
Message-ID: <20210408230522.GS904837@yoga>
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de>
 <YG8qIfFdY+As5tye@builder.lan>
 <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
 <CAA8EJpq4r0-XTouJTxnNdO8tgydenb+LjDykWORSNeLb3vSqMg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA8EJpq4r0-XTouJTxnNdO8tgydenb+LjDykWORSNeLb3vSqMg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_000530_397121_7A85389B 
X-CRM114-Status: GOOD (  23.58  )
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
Message-ID: <20210408230522.LkjbgCzE7_TTVu9-Mijzf_LWgb6tEaROAGKL5UKgqf0@z>

On Thu 08 Apr 16:53 CDT 2021, Dmitry Baryshkov wrote:

> On Thu, 8 Apr 2021 at 23:05, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Thu, Apr 8, 2021 at 6:06 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > > On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:
> > > > Maybe see if you can address these in a follow-up, to avoid regressions.
> > > >
> > >
> > > I'm about to send you a another set of pull requests with some more
> > > goodies that was lingering on the list. I will take a look to see if I
> > > can follow up on that with some fixes for above warnings - and take
> > > another look at incorporating dtbs_check in my workflow.
> >
> > Ok, sounds good. As I mentioned, I'm also just learning how to use
> > dtbs_check properly. Unfortunately, it takes ages to run on a
> > non-parallel build,
> > and using 'make -j32' as I normally do means the output gets reordered
> > with every run.
> >
> > It's probably ok if you figure out how to only run it for the files you
> > actually change in the Qualcomm tree.
> 
> Disabling all non-Qualcomm arches makes `make dtbs_check` a little bit
> less painful.
> 

Yes, this is a trick I'm applying as well.

It would however be nice if one didn't have to disable CONFIG_ARCH_* to
achieve this, or even better if one could run dtbs_check on a single
.dtb. In particular since many of the warnings are resolved by fixing
the bindings, which causes dtbs_check to recheck all files.

Regards,
Bjorn

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
