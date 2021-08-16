Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB42C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 23:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC64060EE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 23:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC64060EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ytAI/2Xl5BfWgrioiuq2Rn6SG7GveYp3fOkgf7aQvCE=; b=ChONWdRh+mrD2v
	QuV7wQxQ6XSVKp4y4lB7H4PpjTLs2ylgBIhaD+XXyGvUF+vOM4uGQbYQSOB45NIQ/umMPfXoM8IgT
	oRpp6ONyZ7ma7XwH5XJlvo7CAPYicsVYh3jK9vENTtH+xdIAMa85N3mptDhfuVImsJydYOBKEKzzT
	bduDf0Msfsfd9DLGiMTxCwYOQNHqvAczV6TOC0720fo1avflTKtOzKWcZpv47qLLd39Onn625w1bv
	XC9WsUZQ0GsAJn/1Oem7a7HU/UWiJoHs7q5FeljkWlOygUfclxDXunv61SHW//vcwxu794MqeMV8q
	yxnHo6w8BbGPNquxoxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFmF8-000WBy-GT; Mon, 16 Aug 2021 23:42:10 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFmF1-000WBc-SG
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 23:42:07 +0000
Received: by mail-il1-x136.google.com with SMTP id y3so20330039ilm.6
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 16 Aug 2021 16:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2DEq8bFOyl5Jq/DdBh6oBU2GKmvGKeW+7mALqJjFNlg=;
 b=f3vWQ8hpMBdzUhxwYoB7ZXd1idjeJdSU/Lux1E2ajeWTow8CGkLMmswSwHWv88uIDV
 Z8fwbsMBs1PFxt4DmLYFdezFyRCIlheNU0LiHc0PVzYb1wtUjs1RoWhYdgpQ+WRxv7Ea
 T8uaB68h7hB4RiinpVFaW6htRwRUKytbbxlu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2DEq8bFOyl5Jq/DdBh6oBU2GKmvGKeW+7mALqJjFNlg=;
 b=Q6UY55g0W59LIsO9P3X1fpFuj5px2GPofapwHUmsvdaY/e5XXduc0q5kmWyUD2xXNl
 aKrXYCXfCE/KcmjrEtPXpasfq4e5ZlfkulosWjmXZZHOyiJYkAB/A2ipYcXGLlofZOpT
 OVyN9HVtwSbp47hQVC81pKZUk5CRWUIFsY0fqbqpCDhIrBf0BhVM4vO+B+gocYpOCbbL
 SIUgm3O+44HiHlZzABGuWnBBiclRksy4wXAtWbNY52qB2gcvpOaVXUgLgK86PK9+FIzl
 a/gVWfgIvRzTsb8J0aviAUSdwQbihflFs1HfK165z5+sPHPgXZ2U2RmeuHv4M81964VM
 mFDQ==
X-Gm-Message-State: AOAM532HrxxtNU+Hx8BZHltOrIBVtdf+f2lZZGRND4bRrhiVlnnjDZDI
 179mCMgtZ9XVUiRRCKx6k8b0ql6Ul02QNw==
X-Google-Smtp-Source: ABdhPJwJ74d7EtygHZ9y/gGj/EAhfpgZ8ASt9fHEwPkeBOaQEtqQqF5NV6k4DG1DA752U54fO1nJ4w==
X-Received: by 2002:a92:190f:: with SMTP id 15mr341694ilz.45.1629157320185;
 Mon, 16 Aug 2021 16:42:00 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id p7sm161793iln.70.2021.08.16.16.41.58
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 16:41:59 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id z2so20380326iln.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 16 Aug 2021 16:41:58 -0700 (PDT)
X-Received: by 2002:a92:a008:: with SMTP id e8mr341747ili.187.1629157318317;
 Mon, 16 Aug 2021 16:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210816231223.586597-1-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Aug 2021 16:41:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
Message-ID: <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, SoC Team <soc@kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_164203_977166_6C15D382 
X-CRM114-Status: GOOD (  10.78  )
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
Message-ID: <20210816234146.ymszhb70emFNNl3pgZvxdnINu4OpXAcp9Kt8QbZLmdk@z>

Hi,

On Mon, Aug 16, 2021 at 4:12 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Douglas Anderson (1):
>       arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip

I hope the above patch doesn't cause problems. I had landed it in the
drm-misc-next tree as per:

https://lore.kernel.org/linux-arm-msm/YMDdyEzCpdttQyNu@builder.lan/

Presumably git will magically do the right thing here since nothing
else on nearby lines is changing, but I at least wanted to point this
out in case there are any issues. Right now in linuxnext I see both
changes:

ab428819ee3f arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
ab6f24b404c9 arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip


-Doug

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
