Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F213BC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 23:44:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BB4761028
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 23:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BB4761028
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mkETHaYDOzQDoIWREdqRKIKG+0QGIidiLtCc0oafDj8=; b=brEScm5PJy5AD6ucGKa//ry8m
	8sjpY+ou8MTC7nqZ0fqB2NdSHDBd2NO4oGdAVMsgGyv/7vYjeLaUddAHrpEomEdlBu7sAf9V2jZNr
	mW6Qxn1BLOVCk2giMSwEbBrPjnzgjHRbbEy/ihpHLtp7qR29kx3xmUkl2ePda0hE1CwUJjtEybTc9
	qN/i7Q25NK1J3zndh8gNMb7zrCvgRw9UzJjVDtC4utlRqK+oEB9coY+oZPJa0snu+FTnS7AAwd1sx
	iyU2mGRKNPmbgxT+Py7vDNdEqcE/QFa1sev33QTCF0mFf8WYfZekDdJGYOVIWwLCKtNPkuJgJa3Ge
	7poz1hyWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUeHc-009UqT-Tg; Thu, 08 Apr 2021 23:41:57 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUeHW-009Uq8-Oz
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 23:41:52 +0000
Received: by mail-qk1-x732.google.com with SMTP id o5so4226124qkb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 16:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8KRUudqQ7fiqiTO1h1nhjXIsFEoc1XK+L2rdZ1uxSAg=;
 b=yHH1TguXIOLaBlQty2FkN1++Ql1LbpqyhCP/Bi9XQjCI+iCfX3544SZzo5Y7gLXcrB
 c3vqh34BZjV/GX060haL1oSrlETmiX2GKL4Hc2D+QH2W7CTmlQuW06kq8qaVXqa3O+Ba
 pYybh9dAQ//7dOoGPTLu//LBK0EntAPRBYR4TLyK2RFNRHKJUVYs3r8MG5f4IwzI31vS
 WPlUBkat9NZq6QOv4mvJDKzSdfg7PV8sG1HwkXKR6Pa6TeNMlsplEoZLwPqcZWNYDYKP
 lmZdS6usMKm8ISMpRX0aWzPtDxGcV+oWwI54ScYD6OcXFo8KBfrQ09Mvey00ZhcR93nV
 myGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8KRUudqQ7fiqiTO1h1nhjXIsFEoc1XK+L2rdZ1uxSAg=;
 b=bR0DmzzAzvPdowsgb4aTF319j/xojjJ2Dx/yQL39IAEX8RlZo5DF3C8jSsX6dIWgeD
 pZavPCa1lKo/9ZoizzxPe5VS5+dthpnC6AAUUr7d63FvBHwIYJ09754pp5o79yj53uNq
 fJE+fMHGY7SIg0hiu0ZQhrnRklqMkzOXe/jTrMkzFf93q+w9qdLGAR+/TN/f9KmMLDiJ
 H8K4YEtpPBygs3fsMGeR5jjuiK9t/Il8IylqLkMOPE1hcE1QpguP7zbkInZCzlOHiyTQ
 pORacUKoOoDzis3bcmEcC4BdzRfEhYeUebiyMgU5Dw8EaERrt0cnqperrybhFW+sMI72
 qSuA==
X-Gm-Message-State: AOAM531bn1SVd7pFWaKTjSaS8Y6TL50gnz65M3U7H74V7yrH24sN7RbV
 /tsbK7fzd7Z11QkSvvykoqzrZEMM6d+W3Q1wNWjQTw==
X-Google-Smtp-Source: ABdhPJyHPuE4navRPOijhLZmY/RoeCxFazCLQbKT5I8ozqsoCzXvOiMSY+ipZbh1hlP3lOdy4M8E0I0XN9PPmb1zcMM=
X-Received: by 2002:ae9:f312:: with SMTP id p18mr11406022qkg.162.1617925309436; 
 Thu, 08 Apr 2021 16:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de>
 <YG8qIfFdY+As5tye@builder.lan>
 <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
 <CAA8EJpq4r0-XTouJTxnNdO8tgydenb+LjDykWORSNeLb3vSqMg@mail.gmail.com>
 <20210408230522.GS904837@yoga>
In-Reply-To: <20210408230522.GS904837@yoga>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Apr 2021 02:41:38 +0300
Message-ID: <CAA8EJprO7jwqaKXXk70hzDJnTU6iX6i2Vk1OxkrwDKFFQQSyEw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
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
 satya priya <skakit@codeaurora.org>, 
 Abhishek Kumar <kuabhs@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Shawn Guo <shawn.guo@linaro.org>, 
 Alexandru M Stan <amstan@chromium.org>, Maulik Shah <mkshah@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_004150_968854_C68CFEDF 
X-CRM114-Status: GOOD (  28.44  )
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
Message-ID: <20210408234138.kzpC3MGn8QbF9DdVwf20N3dZskMA3PWnmxh78nnqkgQ@z>

On Fri, 9 Apr 2021 at 02:05, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Thu 08 Apr 16:53 CDT 2021, Dmitry Baryshkov wrote:
>
> > On Thu, 8 Apr 2021 at 23:05, Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > On Thu, Apr 8, 2021 at 6:06 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > > On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:
> > > > > Maybe see if you can address these in a follow-up, to avoid regressions.
> > > > >
> > > >
> > > > I'm about to send you a another set of pull requests with some more
> > > > goodies that was lingering on the list. I will take a look to see if I
> > > > can follow up on that with some fixes for above warnings - and take
> > > > another look at incorporating dtbs_check in my workflow.
> > >
> > > Ok, sounds good. As I mentioned, I'm also just learning how to use
> > > dtbs_check properly. Unfortunately, it takes ages to run on a
> > > non-parallel build,
> > > and using 'make -j32' as I normally do means the output gets reordered
> > > with every run.
> > >
> > > It's probably ok if you figure out how to only run it for the files you
> > > actually change in the Qualcomm tree.
> >
> > Disabling all non-Qualcomm arches makes `make dtbs_check` a little bit
> > less painful.
> >
>
> Yes, this is a trick I'm applying as well.
>
> It would however be nice if one didn't have to disable CONFIG_ARCH_* to
> achieve this, or even better if one could run dtbs_check on a single
> .dtb. In particular since many of the warnings are resolved by fixing
> the bindings, which causes dtbs_check to recheck all files.

As a quick hack: add the following rule to the top-level Makefile:

%.dt.yaml: include/config/kernel.release scripts_dtc
        $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
Documentation/devicetree/bindings/processed-schema.json
        $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ CHECK_DTBS=y

Now you can run checks for a single device tree by running 'make
ARCH=arm64 ...... sdm845-db845.dy.yaml'

I don't know if it's worth including this into the upstream source tree.

-- 
With best wishes
Dmitry

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
