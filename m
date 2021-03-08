Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF91CC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:04:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 97A6D6522F; Mon,  8 Mar 2021 17:04:59 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B1864FB8
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B1864FB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJJR-0002p9-Ch
	for soc@kernel.org; Mon, 08 Mar 2021 17:04:57 +0000
Received: by mail-wr1-f71.google.com with SMTP id m9so5098490wrx.6
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BXtq859FRQFtajUaYN/vsNNVk2NCapuaGNff+HIq1fU=;
        b=BDXNIctjPUluFfnG34+tZ2Qq6hPyBKAfKOORNmyB4xYu5ALBms6XasHHeZaywgJifK
         vWqCYGG0OKxfrZMVPGPUqNOZcn08AHqHK1uq2Vux0fJln+pmN6aOuyC+TdjR4SqZTKrI
         ePc5KzGx8rpCGT2lZ0gTxdi6vfwgUbpF09W+T+EBD8BYi79NCLpohT2oA2n/KhUpa0MQ
         GK0dV326sLumFfhLZLWP28UiP2OT14V5lj6lDfYm0+6uJBdNgam/1WAkGfjert8CiEDx
         anX03HSMIt4z7peUmbGbcuwbHhuSrV281eS/YBkBO34lrdEqonKTFeTBV7C2/Wospfxf
         XNww==
X-Gm-Message-State: AOAM533i9rmTe7mXHYPg8hk1K7PNDfczNmDHvCebjl5eCvmdXHpt5pCu
	m4OqMFBXxsywd6U+u0a5oqthgv+dP644n3CP8WAQaBDEiGEZ/4So6Lk3acUaSUV2TfRjdUNNetQ
	I4uocPqs2s0yxviJ0GMxHE8U=
X-Received: by 2002:a05:600c:2282:: with SMTP id 2mr23166409wmf.93.1615223097155;
        Mon, 08 Mar 2021 09:04:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLrFBqic+DPXYmImXzmYhbuZCgb6qkVJhkld52yZQWkqYiOpDyptEHqsQ82up1jI+m7+KO/w==
X-Received: by 2002:a05:600c:2282:: with SMTP id 2mr23166377wmf.93.1615223096907;
        Mon, 08 Mar 2021 09:04:56 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id v2sm13166218wru.85.2021.03.08.09.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:04:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Google-Original-From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 8 Mar 2021 18:04:54 +0100
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [RESEND PATCH 00/10] arm64: dts: intel: socfpga: minor cleanups
Message-ID: <20210308170454.sbeylw5istqeglfl@kozik-lap>
References: <20210308162228.62614-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210308162228.62614-1-krzk@kernel.org>

On Mon, Mar 08, 2021 at 05:22:18PM +0100, Krzysztof Kozlowski wrote:
> Hi Arnd and Olof,
> 
> This is just a resend of previous patch. Since I did not get replies
> from Intel maintainers, I assume this could go via soc tree directly.

Actually it is my bad because I think I skipped Dinh Nguyen. Let me
resend it one more time, hopefully to proper address.

Best regards,
Krzysztof
