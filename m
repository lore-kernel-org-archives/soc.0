Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2217C63777
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 02:04:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74830207FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 02:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iARNei3D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74830207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mfKvQhpVQCIGZwJmjUQ4sBh84jFnsOUKDL9lqwv5x4o=; b=iARNei3DAhWk74mnWjm8q4Z7W
	CHEx2jxR47v2qKiMhq7li8sVr6p7gPFOc70oX4LNfilVYXSvfY74unPO0uUfKBT6qs8XyZcgProsE
	htu+Pf2zok04zm/zKaSPdvZwMvLX3uT6i7T/qV472sIckNonhTk3FCK+7/VHvAiW7mJ/6caya11eA
	BadQ6i+SysPdajapbpVzmyTqfdhMPXXQZqLkxKQtBG2NQiqRiGg4yEe01pRodMGwbimlMevoeVDi5
	wosDMjfyS+/WWqKPTl26iASfHwdxw5cVSKvc6GWrgc+oFD6iady04XwbYKQN7/OsRE5SVQDF/UUu4
	s+vW0cQmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjv0d-0006GZ-Am; Tue, 01 Dec 2020 02:03:15 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjv0X-0006GD-Eb
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 02:03:11 +0000
Received: by mail-io1-f66.google.com with SMTP id k3so56638ioq.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 18:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Zy3hLt0xkkBgO7Nur8AYnrY8ZOOFFFXYaDalID7C9w=;
 b=nJWFopD0ngzTtNfJIUYnGdx9+TMKMX4hP0eNwGHJlnUP53vFk3WhW9uo9V6O5Y6VGV
 3YX0cYhXGgIyRrkeE5llKeWZLkHenyyC+idXi5cOqseNwriEiEhb8JqoYsgcZBEbbvZd
 vDVH44aBdy4NHwTpPsJtjBgAZJnOyJmW0x0I0Lxq8zr4Uo9tNzPkZCSTtFTWEzUkIoC8
 tsnd5E5F+KQBhScMLoLYI/oVsfsWpQMbCmed+4NMYR7qtzf/a1QJXiRtZpaLDh7ZL6qC
 ahonhIjvsrPvw4JvV7X5y85Y2lkVshY/wd6tpqHM/uSBka38XroG4ar7V1kTN8UjkmxK
 Blbw==
X-Gm-Message-State: AOAM532zzeaGiDDPwQhTx5S3prhbdUxQkHpZZxA1NpjAaP8PrCI7cPr9
 4ycF0o2e4Kd+s9w67DS7zu/L3QA84w==
X-Google-Smtp-Source: ABdhPJyJO19//cOlfXYuKkU69EBSQ7B5q3bGWe2glFhP12AG6qNZC3Z/SLpJjYEVdrkPAxDh5KMhzw==
X-Received: by 2002:a02:85cc:: with SMTP id d70mr658274jai.83.1606788188806;
 Mon, 30 Nov 2020 18:03:08 -0800 (PST)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 12sm215807ily.42.2020.11.30.18.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 18:03:07 -0800 (PST)
Received: (nullmailer pid 3484888 invoked by uid 1000);
 Tue, 01 Dec 2020 02:02:56 -0000
Date: Mon, 30 Nov 2020 19:02:56 -0700
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO
 controller
Message-ID: <20201201020256.GA3484800@robh.at.kernel.org>
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <20201129110803.2461700-3-daniel@0x0f.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201129110803.2461700-3-daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_210309_524949_5881E4D0 
X-CRM114-Status: GOOD (  12.20  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org,
 w@1wt.eu, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201020256.DsKG-NQIdKxKxUnW9l9nYluq-fsduN-HajBglKZD8kY@z>

On Sun, 29 Nov 2020 20:07:59 +0900, Daniel Palmer wrote:
> Add a binding description for the MStar/SigmaStar GPIO controller
> found in the MSC313 and later ARMv7 SoCs.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../bindings/gpio/mstar,msc313-gpio.yaml      | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
