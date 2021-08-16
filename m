Return-Path: <SRS0=E6oP=NH=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13047C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 23:54:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D856560FDA; Mon, 16 Aug 2021 23:54:23 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADC5460F46
	for <soc@kernel.org>; Mon, 16 Aug 2021 23:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADC5460F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id r16-20020a0568304190b02904f26cead745so22966825otu.10
        for <soc@kernel.org>; Mon, 16 Aug 2021 16:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
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
        b=nycQuP3pUynJWhBlTJ+HHip0ReqKa0oJP+FFATvK+a4uhyRMln4XXMcCo7fUOatIZs
         957ucS8uwpVzCpZ7Prcuo9rN/GLLTNj7560WgznI3FhwQwm0BCjhycL8VX+jC4gD9w7+
         /e9UwEcb7ahDUh5FbAYc9/TkHybDQAJcDgKTDvux3o6YA+W2QkOGLN2rCuR6r0h3R8J/
         v4838Iqal4IXskbOJjodBWrWZD7R46s8VIdk5jeOZXqtqoDM5C6J7yiDDfPynRGFwUkH
         6EIM+xy6vBJ1U6cdka32yMFlhdgA/QmS2gdpY2qzHaKFgJOTwsAIM72DCtokPx6w8zQl
         mD2A==
X-Gm-Message-State: AOAM530ybL3VrOMQ50ZT5LEyl6cvlhoJ7n1PM6T6IWVudPOc6a04rPke
	MQLiABCUgAtefSU2yINLHTo5xA==
X-Google-Smtp-Source: ABdhPJx9K0ZcVWdYg96uteYKBxPeb5UKmYEvO1kAGGbeqVsZ6BCoMhiWIgX69AX7RO50tkTYlN0H2A==
X-Received: by 2002:a9d:266a:: with SMTP id a97mr516885otb.114.1629158062896;
        Mon, 16 Aug 2021 16:54:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
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
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Alex Elder <elder@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
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
	Jonathan Marek <jonathan@marek.ca>,
	Kathiravan T <kathirav@codeaurora.org>,
	Kuogee Hsieh <khsieh@codeaurora.org>,
	Ravi Kumar Bokka <rbokka@codeaurora.org>,
	Robert Foss <robert.foss@linaro.org>,
	Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
	Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
	Sibi Sankar <sibis@codeaurora.org>,
	Wesley Cheng <wcheng@codeaurora.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	satya priya <skakit@codeaurora.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
Message-ID: <YRr6rLXRn0m4KUMx@builder.lan>
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
 <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>

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
