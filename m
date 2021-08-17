Return-Path: <SRS0=cSn/=NI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0943EC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 08:27:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEEF360F58
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 08:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEEF360F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0PDB/mxDWLFzNYjyaO1nYoFjbd+0Yx6GTTaiOF+/kM=; b=XilIWX1r91fl8I
	dbnxEVvGusjQcyr/g3LrE6oiHJnCScTPxD+GBytLS+jjYM9C5+yS8v5H0dqlMQ2Au5sLr0LG1hVyh
	GoJZsm8XkyKzU7D8fp8LZbGkTklGzVlJu+rZedp0wGZWmN1giE74nrgunjzxdQV0lTxO5U2aRkeAG
	g0leQuOvK64XBXzbXrtXwqJy+CRqd1Vj2KO0ejpIsYEEDAqs8Fm6wEmiLoueR2kX2+03Pk05o45sI
	StlT+vJl23/EFshBD3Fc11N+JfNvQ39mDH7cLD1iKJ87ILWk6AS8LK0alSlHy5XzD6x3NP53gw1Au
	ZtEF5WyhYxLhkYytD9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFuOa-001aCP-Hn; Tue, 17 Aug 2021 08:24:30 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFuGb-001X5h-FO
 for linux-arm-kernel@lists.infradead.org; Tue, 17 Aug 2021 08:16:16 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MXp1O-1mahJk3frQ-00Y80N for <linux-arm-kernel@lists.infradead.org>; Tue,
 17 Aug 2021 10:16:08 +0200
Received: by mail-wm1-f45.google.com with SMTP id u15so13152804wmj.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 17 Aug 2021 01:16:08 -0700 (PDT)
X-Gm-Message-State: AOAM533vzHIdHlU/fjixYJe/euqh1PX23kmnDwNrf/1g2NYjxDQRbjR3
 6+ixIf6fpu+4KWu34wm7wsxkLMHSl4fcuzqsYyo=
X-Google-Smtp-Source: ABdhPJzlr2DgXf+7LxALEnoTzhLxUSfXQkSzf2m61KgnQs42OE+o8NnnlZ/uvQYVbXlgb9n2lgVbC3mBF768k2rcJPY=
X-Received: by 2002:a1c:6a18:: with SMTP id f24mr2092620wmc.142.1629188168249; 
 Tue, 17 Aug 2021 01:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
 <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
 <YRr6rLXRn0m4KUMx@builder.lan>
In-Reply-To: <YRr6rLXRn0m4KUMx@builder.lan>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 17 Aug 2021 10:15:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0_dS_wvWSLx4RmnGc5dwYFyrsPrVNBAGs1DTXnWWoX-g@mail.gmail.com>
Message-ID: <CAK8P3a0_dS_wvWSLx4RmnGc5dwYFyrsPrVNBAGs1DTXnWWoX-g@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Kevin Hilman <khilman@baylibre.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Alex Elder <elder@linaro.org>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, 
 Rajendra Nayak <rnayak@codeaurora.org>,
 Sandeep Maheswaram <sanm@codeaurora.org>, 
 Thara Gopinath <thara.gopinath@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>, 
 Georgi Djakov <georgi.djakov@linaro.org>, 
 Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
 Judy Hsiao <judyhsiao@chromium.org>, 
 Martin Botka <martin.botka@somainline.org>, Robert Marko <robimarko@gmail.com>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Baruch Siach <baruch@tkos.co.il>, 
 Felipe Balbi <felipe.balbi@microsoft.com>, Jonathan Marek <jonathan@marek.ca>, 
 Kathiravan T <kathirav@codeaurora.org>, Kuogee Hsieh <khsieh@codeaurora.org>, 
 Ravi Kumar Bokka <rbokka@codeaurora.org>, Robert Foss <robert.foss@linaro.org>,
 Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
 Shaik Sajida Bhanu <sbhanu@codeaurora.org>, 
 Sibi Sankar <sibis@codeaurora.org>, Wesley Cheng <wcheng@codeaurora.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, satya priya <skakit@codeaurora.org>
X-Provags-ID: V03:K1:FATSSX6c3O3q/H43D5Fh55iLcnXxUZkzsWgT3DiPYsyEQym7t7g
 wLbbkR/JNmOnPx3h0vzUuc8cjimuuZ+Qgy9Oj0zlcv7yWZJGTikmK9x0rjzTo0TxZZk7vFP
 AOr+uT2PX/J2wXrPewIF0pB3QsNbm1OPF9fCeKhjpokEktub/ijiYH+5I95TIGU4Rz8Y6zm
 nMtk0luPPptWATJ5VytBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4wh4x8PlagE=:Cvkk/+kqhbGbTEbx9fhvmm
 0nsmQuE/O6YIj75y05v/QpQBsJS0n6oUoMUnLG/xSiHpAKgetY69pOvqf6og3LpHLftev7qj7
 OaIZalLAkhXNmccvAjWuqQcmC0NLUWrxeb9Zjf4Tx7OIGDN23QwtaInyVLBqfPftM76FavIvi
 au9UDKWVqfNLJb0oj/1VGqquEYN+baLki8j01H3XFwqV+lBbcVYZdAMqRIr8RfK3xsu45wRKz
 KstM+YJEsF+u4vWVSMTeHYkpe+f0pefSq4gsYh3n9EYzEFUJTzQCMcw7zE1jI8i5oUBzqfBsK
 wWOOVK8vYpGqu0dpj9t2j+JE7NXXO6SK3KPPI7iT6CGfizG0P3OS4VqLXEN9vvezC6e3g4d9M
 Vd2HNM/WthESapMo4Pys3nLhU2ciDWtIZJKEs9LQ6ethrRjje011SYamlFEa0tEtExAdkAlSt
 R+e1W2oHcS8JhLGsPRozDFNmx4BlpWQLouwZ4ycqu3BwvMcOjZ+jhWToWCu9N0yTWiSKQJFIc
 CHw7A1CDv6dD6eH8aBa3riZe3sHFMlvkje1err1gUv39bdZyTD1NEXWe7HeVIbd3lG633lMCc
 SW21VbfFqtZjZpZGevFG7CG+RBRUkL4upr/Qg+1hFTzHD6BurfUA8gDnYVk0L3dlIV2WpWkkf
 OZBn8/iGokoKtNXGwSRxlq6uRYRgQlXSbIm7GXTS46k78VmLW5nFzPpZYWomunYG9VnXfHUln
 LBLtDzLQnx44oWoyprOy/yN7SwuCGxr5R4nxz0TPxuyjawOIwvPjnqMTZyuyf35dwnREzeM3t
 mUXjZ0ku2cJc69+7siZRYysownrWe1/uAgwF6Hb8AhRepi3KenTFwxPubqK0iQW8dk6/Q/IMU
 iN7z+VDbITnqRnQ0DvKQJwWh70Blyb0PcIRMpt9F8nclIYlLKbHlMy0K3rxHpmKXdhwd2V01r
 fKy4Gckw8XDjYLLXOxSh7/sMAF61bMJd5MXu2DqhV7iYLZnHRksTV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_011613_877389_99CD163E 
X-CRM114-Status: GOOD (  21.06  )
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
Message-ID: <20210817081552.c8yautKz8YcXjFWlg08s9iQSnnytdUMsUfvtuo-nVyI@z>

On Tue, Aug 17, 2021 at 1:54 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 16 Aug 18:41 CDT 2021, Doug Anderson wrote:
> > On Mon, Aug 16, 2021 at 4:12 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > Douglas Anderson (1):
> > >       arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> >
> > I hope the above patch doesn't cause problems. I had landed it in the
> > drm-misc-next tree as per:
> >
> > https://lore.kernel.org/linux-arm-msm/YMDdyEzCpdttQyNu@builder.lan/
> >
> > Presumably git will magically do the right thing here since nothing
> > else on nearby lines is changing, but I at least wanted to point this
> > out in case there are any issues. Right now in linuxnext I see both
> > changes:
> >
> > ab428819ee3f arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> > ab6f24b404c9 arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> >
>
> Yes, we agreed that you should take it through drm-misc and I must have
> forgotten about that as I drained the patchwork queue.
>
> This has been sitting in linux-next for a while now and I've not seen
> any reports from Stephen, so I think we're good.

I just double-checked that the merge went in properly, sometimes
this kind of patch causes entries, but in this case it's fine.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
