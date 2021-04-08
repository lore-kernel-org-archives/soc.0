Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD891C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 16:09:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432C961132
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 16:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 432C961132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aplMP53h//d3EqAoIJGA8i1FfojYZIv+Ug3dq2GlTE0=; b=BNgBBklLQ9NH32eWwaKFjz3Ht
	ZINEmnTBafusQCNTcKTe1ZtNEcPhNqpBi4+5qtRhBIJ3S2laTqTCEQfiEygyqYvm3mUFELETu7k8w
	uCVXFIsZ5incPWPMKIDqiGLEB/KM61tk73ZyEoCzHI7Fo7q3vo3bS60YqFiylPXnLgGnJo+SJ49iU
	X29sXG1s6lFAEvsu9HdC9zeUSkIJ8sN6ML750JgT1l7BZLEiZxPpD98XvHxn/O1CxhRWXwTPPH3wT
	7q1YTb8bQRFW0kga9M14kpfK9puAK7pHEYn8CrHmk0wyaLJqGNnKuvFKPdRsXDk2HxpbmtrryiX69
	3/LYiG3Vg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUXBS-008ZqO-GY; Thu, 08 Apr 2021 16:07:07 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUXBN-008Zpd-PB
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 16:07:04 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id
 j10-20020a4ad18a0000b02901b677a0ba98so634806oor.1
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 09:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8n6PD398vLDKqWf/ectqMMJzVXR9M2nPC8GQRN8gd1w=;
 b=bownvqCi3YJTcISqfbTLfxHDhrVz8OdhEkj/GuyB/zzXxAIOGiYl3nrvQWCmV8SsTH
 glFehjiK+guuep8vsLJBCFb2jbeI3eDRnwx0t0bUcF6UWZiutMV9MLzLQ2kyI+ULr+82
 NGHyiziysRcDJaqaKBsaHf2DFtNlDkL3zCgc6ECB8ZC91IQH4dOIrLB/7d/rAqkaGTOr
 BGfC6RNM7D787J3qRZBEQ/cO69vy5gBA0Fwj/jDzBmvk48vgcEUObnSgsOxfp3rcTmQV
 4QrvyWpcB7l/7swxnQcBGw/52d9uHByhJ3MEdwfbgYebUowLg5o1hjN3cpBLD/00kB2l
 ENzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8n6PD398vLDKqWf/ectqMMJzVXR9M2nPC8GQRN8gd1w=;
 b=NNEgWbOVLrIvWy5r6ts4atGV4ynknE2BV049Bby2WOl5FSgWbVMAn0+d37rxR1AXrE
 jp8YqVhT3zSLBT3yrx8aY5mE8CHTx3j6T6UDKKEpoZluPfeDR6stj2C9a9xr7luj6u26
 HSWv9BaBTpgx0Ooj2lgWrYDjS5KIbFdwjeTN3IBMJUnu1jetD7OYuNokpHjrRnCS63zK
 bGqlzyYVOt7zGqVEeXUKNI6BM02g5jnI8hYcLXUhTUzXFcoR2mqIHQsWkTEy+RaDNkEd
 8MxorHzoPoVOtDqOGQYhiDr0F1hFGMANVS6Kyi8Kjisr6+nVZKye0NTsj9tpwvjCIx56
 WTlA==
X-Gm-Message-State: AOAM531NRQYsVldEt6LQ+o22elTfIb55Nbv4UZpVGmp6G07wfwwHhLrt
 xmZDrYqfcu/A57j0rgTZCMBOi2wyiYv8yg==
X-Google-Smtp-Source: ABdhPJyofHnn0NB/A8bZ/Af2kU9kjgUV8JKD4Y6VBFrtZ+X51GBGSQxpBVwm7UoxRU4RDfvKzXYCMA==
X-Received: by 2002:a4a:4843:: with SMTP id p64mr7998193ooa.9.1617898020081;
 Thu, 08 Apr 2021 09:07:00 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id d13sm6242543otk.74.2021.04.08.09.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 09:06:59 -0700 (PDT)
Date: Thu, 8 Apr 2021 11:06:57 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org,
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
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 satya priya <skakit@codeaurora.org>, Abhishek Kumar <kuabhs@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, Shawn Guo <shawn.guo@linaro.org>,
 Alexandru M Stan <amstan@chromium.org>, Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
Message-ID: <YG8qIfFdY+As5tye@builder.lan>
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161789462034.1629934.2631576576205147984.b4-ty@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_170701_935536_DFE77309 
X-CRM114-Status: GOOD (  18.06  )
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
Message-ID: <20210408160657.McgRsQqzUlNgZpHVxb-1PEXgPNtYJdzX2OMDElQk-Kc@z>

On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Sun, 4 Apr 2021 11:49:14 -0500, Bjorn Andersson wrote:
> > The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> > 
> >   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13
> > 
> > [...]
> 
> I noticed a couple of new warnings from 'make dtbs_check W=1':
> 
> qcom/sc7180.dtsi:1204.21-1220.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a8c000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> qcom/sc7180.dtsi:965.21-981.6: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@8c0000/i2c@890000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property qcom/sdm845.dtsi:3912.23-4045.5: Warning (simple_bus_reg): /soc@0/camss@a00000: simple-bus unit address format error, expected "acb3000"
> qcom/sdm845.dtsi:4041.10-4044.6: Warning (graph_child_address): /soc@0/camss@a00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> qcom/sdm845.dtsi:4102.32-4129.5: Warning (simple_bus_reg): /soc@0/dsi-opp-table: missing or empty reg/ranges property
> qcom/msm8916-samsung-a5u-eur.dt.yaml: spmi@200f000: reg: [[33615872, 4096], [37748736, 4194304], [46137344, 4194304], [58720256, 2097152], [33595392, 8448]] is too long
> qcom/sc7180-trogdor-lazor-r0.dt.yaml: gmu@506a000: compatible:0: 'qcom,adreno-gmu-618.0' is not one of ['qcom,adreno-gmu-630.2']
> qcom/sc7180-trogdor-lazor-r1-kb.dt.yaml: memory@80900000: 'device_type' is a required property
> qcom/sdm850-lenovo-yoga-c630.dt.yaml: memory@97b00000: 'device_type' is a required property
> 

I saw your other email regarding these and per Rob's request we've
ramped up our effort on cleaning these out. I've however still not
figured out a good way to incorporate the dtbs_check in my patch
handling workflow.

> Maybe see if you can address these in a follow-up, to avoid regressions.
> 

I'm about to send you a another set of pull requests with some more
goodies that was lingering on the list. I will take a look to see if I
can follow up on that with some fixes for above warnings - and take
another look at incorporating dtbs_check in my workflow.

> Merged into arm/dt, thanks!
> 

Thank you!
Bjorn

> merge commit: 61bac46eed14ad73cd41c5b7075350fef78ca4be
> 
>        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
