Return-Path: <SRS0=zpYd=FN=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78219E743DB
	for <soc@archiver.kernel.org>; Fri, 29 Sep 2023 03:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F8C6C433CC; Fri, 29 Sep 2023 03:35:03 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF476C433C9
	for <soc@kernel.org>; Fri, 29 Sep 2023 03:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF476C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c724577e1fso37478485ad.0
        for <soc@kernel.org>; Thu, 28 Sep 2023 20:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695958501; x=1696563301; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HP9g/8ujJMa7tWcM5+uRVJlaPLI8TNMtBPHn63AVXHs=;
        b=GDOkhtYK24Aias42JQXuLplk/Z1h/unjJrWXcvRoh+Bi+E022mZSUWkKQhASu4VTq7
         0CPcMNbdAa2hZpp3YpKgxLyl3knA3awWXSi8OTAX4hDFVh3aPI4+ubyiEeHL6rGK23YI
         v/OXBfI7bbVI9qFId6ZTaeKmf7/rAnnosiEVw0Dpy6Qcb+kHrO8P+Xc+IpDIcWQDjUi2
         eiyihwJQ2YIB3dTF9OQBlNBeRnokZ4iPeL8BEBVu6v+BBwAD/Bwbvs+Pxx+IwIBocYRY
         kXpHfOc/incFeLIcTZnDCfoPEfcwp/BUWn1i58Nr7JMcqTJ6iIEYTJQww/qCY1hAuYv7
         yeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695958501; x=1696563301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP9g/8ujJMa7tWcM5+uRVJlaPLI8TNMtBPHn63AVXHs=;
        b=iQWjZcod3f8efH0id1dOu6aVesyryql1Aw/Vn9gKt2v2TEgRa6ecV1gSqym6sdRMlv
         5v3gGavjodODgeoXA7WBMvG0vLZq8GKH6OP67ZIuGpbaBFKL3s+ePUQfkQrok9oKoodv
         en86foLflChY70W4Ub6l27ki+XVdnlti6LPQzpTYCoYXTtW3u8FwllFGhXiDYq/NTncF
         lm2g06S/zzLnZIrWLxZrXQJQml+E20Ra10Hyv8g18OYKhcoG6Aj1A/79UvIZsHnpVcMn
         ZfMRt3BvJzKk0Sk8TFMtwgetuPzU8ieaDLHYrjAxg/hs8/sTAd93WnrNUxjMNHpc8+jc
         RjGQ==
X-Gm-Message-State: AOJu0YzPwy5luTsmzasedE/qtH7KCyvVi6NWIndGbejipXRI5j2N5hfZ
	taYDcwEUU1M1g068nvjCyF5h8w==
X-Google-Smtp-Source: AGHT+IG/x1zQDAVplp1UNHm3GUCzQBw8v+D24VTKD/duYQ3xzfbQZ0leD7mWhslO9LgDqys4FVRwig==
X-Received: by 2002:a17:902:e748:b0:1c3:a4f2:7ca3 with SMTP id p8-20020a170902e74800b001c3a4f27ca3mr3545979plf.66.1695958500990;
        Thu, 28 Sep 2023 20:35:00 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b001b7fd27144dsm15898651plj.40.2023.09.28.20.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 20:35:00 -0700 (PDT)
Date: Fri, 29 Sep 2023 09:04:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm/arm64: dts: Removed undocumented and unused
 "pl022,hierarchy" property
Message-ID: <20230929033457.b743ffge7b26behv@vireshk-i7>
References: <20230928190859.1072420-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928190859.1072420-1-robh@kernel.org>

On 28-09-23, 14:08, Rob Herring wrote:
> The "pl022,hierarchy" is not documented, all instances use are 0 and
> isn't handled in the kernel driver, so let's just remove it.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Arnd, Please apply this directly.
> 
>  arch/arm/boot/dts/st/spear1310-evb.dts              | 2 --
>  arch/arm/boot/dts/st/spear1340-evb.dts              | 2 --

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
