Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F04AC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 23:56:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A946054F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 23:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47A946054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgicuSIHqlPhNmWzQUuKVVu79xd9GHNnwXL8hxb9sZI=; b=pOW3I5cCmY5j73
	L4PhwiHJrcIzcQ9q4bDGTKHYVY9kJEWhW/KkRQ6hp3d4KLXAg7EGYgWUOKYwyWMkIRO2xQQa4Xyqj
	szFhZiINpRj9+jasX1lkb4zehekVfWpaVSdglB2vHBXSOxbPyiUfreJm3wUnKYR8l1BAGMHqsfCCP
	6weFqh2FB2XMezgmjVdcK6G597+UmlsYFcQnWSqoq+vETjzNrQeS6QlQQ0RviktW0w93+IkwSijrY
	ZSJchW02Zkv+A+ZqaMfBiLJvvjRjuNizYuq2ih36UsaVRA1o4c7HHcyLc4tl/mv3jJaV/RcI0NcYh
	PcpaKVvB1/BMHxS3yTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFmR5-000X2F-PS; Mon, 16 Aug 2021 23:54:31 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFmQz-000X1T-D0
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 23:54:29 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 l36-20020a0568302b24b0290517526ce5e3so15550552otv.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 16 Aug 2021 16:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C/+tcWxYcIbJj6nDg1OA6yUYjPHVJrZBuqhcQg7Ah6s=;
 b=tzJb0+FxFuiQBpr+lK5+jBOnv3wL/4natRvzyL0KVnCyd4W30Dl0MtiOyb30nizQIQ
 xe6EF+PpGytDyXHhvsOqSbyZB5t9dhfQfo5qY6yaRMdvGdBb8uY0NlvRteOHmIPoqEtX
 dqmkJdFcMwleJjUhXK+PJnsfT43aJVz+K+0G/GT/X/NhxZhSTV+sJX45XvcWDBUHYT3O
 SsMC6EBSZIwdpqD/Hwr6ra/28kJPl12uesV69IwYgc4DGzUpKLA7tFIi2BSx3a4rhfLB
 Bwy3FaM3ASXasvXMqfRljNWoLdLHrQGsYctYoWZPrY2ESciKLEqpzZgLCQLfERkKIUV7
 5yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C/+tcWxYcIbJj6nDg1OA6yUYjPHVJrZBuqhcQg7Ah6s=;
 b=ph2d1eozqk1Djvgp9iHJFcZBkaO4UL41oNvng7BOoaj3aS4QVtq34I5PiTBEbnNA/5
 x7zY8OaBk0TY2yiB2thuSXks7K45VE6h2uWvrwO2pIPUaXBJuM7oJfHsHolW3kxW2xzK
 KVW8Pq0vmm9/rLppcXZnmGogZgP2h0zoX9lbRCFksNvONK34tagGD3XEF817H7tZp2dA
 ZeYH6poejaAZzm2bbyR3jcW/CYgid6m9ntvtSBRsnrXHjtmJ8GsBddW53waK/UItOOrT
 PASb6O0O/b2xsC5PN8vvJrq8U9SOZicfwhQ1NnboUoPDmLAtmiw1QMh92FtmgG4xuoKP
 bzZA==
X-Gm-Message-State: AOAM533t2WaCntWP4lFfMUhhToTkY5YeV4iEn63zDeFiwMMud2DQLYJb
 Ag82+0gU+LTldlX1lNaqAbC8Mg==
X-Google-Smtp-Source: ABdhPJx9K0ZcVWdYg96uteYKBxPeb5UKmYEvO1kAGGbeqVsZ6BCoMhiWIgX69AX7RO50tkTYlN0H2A==
X-Received: by 2002:a9d:266a:: with SMTP id a97mr516885otb.114.1629158062896; 
 Mon, 16 Aug 2021 16:54:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id r1sm113739ooi.21.2021.08.16.16.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 16:54:22 -0700 (PDT)
Date: Mon, 16 Aug 2021 18:54:20 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, SoC Team <soc@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alex Elder <elder@linaro.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Sandeep Maheswaram <sanm@codeaurora.org>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Caleb Connolly <caleb@connolly.tech>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
 Judy Hsiao <judyhsiao@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 Robert Marko <robimarko@gmail.com>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Baruch Siach <baruch@tkos.co.il>,
 Felipe Balbi <felipe.balbi@microsoft.com>,
 Jonathan Marek <jonathan@marek.ca>, Kathiravan T <kathirav@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Ravi Kumar Bokka <rbokka@codeaurora.org>,
 Robert Foss <robert.foss@linaro.org>,
 Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
 Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
 Sibi Sankar <sibis@codeaurora.org>, Wesley Cheng <wcheng@codeaurora.org>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 satya priya <skakit@codeaurora.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
Message-ID: <YRr6rLXRn0m4KUMx@builder.lan>
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
 <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_165425_554599_3AA940E2 
X-CRM114-Status: GOOD (  16.75  )
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
Message-ID: <20210816235420.TGw0O1OZpGGhFvBJvgZfAyHMMDG4SPbyrM9q6O9e3f0@z>

On Mon 16 Aug 18:41 CDT 2021, Doug Anderson wrote:

> Hi,
> 
> On Mon, Aug 16, 2021 at 4:12 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > Douglas Anderson (1):
> >       arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> 
> I hope the above patch doesn't cause problems. I had landed it in the
> drm-misc-next tree as per:
> 
> https://lore.kernel.org/linux-arm-msm/YMDdyEzCpdttQyNu@builder.lan/
> 
> Presumably git will magically do the right thing here since nothing
> else on nearby lines is changing, but I at least wanted to point this
> out in case there are any issues. Right now in linuxnext I see both
> changes:
> 
> ab428819ee3f arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> ab6f24b404c9 arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
> 

Yes, we agreed that you should take it through drm-misc and I must have
forgotten about that as I drained the patchwork queue.

This has been sitting in linux-next for a while now and I've not seen
any reports from Stephen, so I think we're good.

Regards,
Bjorn

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
