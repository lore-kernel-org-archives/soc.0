Return-Path: <SRS0=JTxQ=6D=gmail.com=zhang.lyra@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB45FC636CD
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 08:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67FEDC4339B; Tue,  7 Feb 2023 08:21:51 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A72CC433EF;
	Tue,  7 Feb 2023 08:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A72CC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 6so7451316vko.7;
        Tue, 07 Feb 2023 00:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qxIrUXBoB2zyDeM1COleyFwtINkoTGd1PktA2wpEmEA=;
        b=pufxl/WHKqM3Y+0cFFtpThhfHYZ9YO609hoMXgC0g4sbYJ47SGU4uKc0cL9tKF0JUB
         wAqlqiBBnq5GhMNTkhJwWC1JFrf8zmtWEqaQymkPNcXS8NsTBSOeaIs0EMaRQhgA9NzF
         AG52xo8CJj1eoX60akdaSUMOgZEipsPi8yRhoo5zEzXYYd77HVcqe/XhwRDK37mxh3/O
         JRQqMG4sm3buj1qlFfbPNQ0QT1Yq4XRGC3mavdrTOFCD7AmOJxzpZtjMrXUt1zLEKcfo
         CR17EuxDAnkqPTxcBWTuqUI4xzvq+KOJx91NIWwJ19TPyJhfjPzBXHynVMRk3LYaU4oE
         c7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxIrUXBoB2zyDeM1COleyFwtINkoTGd1PktA2wpEmEA=;
        b=ZtSnx5ScT1XzjN/ZYPjBZ1DgC7NzAKnHYtxYAeLWu5IyE6BdoXmlxwAAEVKdqofRtH
         +slAL+wZ27LIDT53hlgGI58A6RYTnS5vAY5Awjkt1gQZPWZX/1QIim+MEo79oGpxnlmg
         u1KrjdswTxJYwXmyI0z+4jAG1ProsqHW//e4anQEgzRgUhvS+xeI4QCwJZafUoQhW3p2
         q7VjPD3ygIW4wvKyALFuhBmjQ3iT8nhfeeLUfmOEp3bKWhv+An/25FKPQea7pplRVai2
         vC8oUFGX0fW4NGHzcnSQtP6p4l7FZljdUXzWTC8QeM0DYVsH6A9oYnVlSQoQARfqoc5Q
         rlBA==
X-Gm-Message-State: AO0yUKWubuZ+6sHUqHXRNs4AqCCaXEmbZZNb6Fbd1PkFoDmTbof4YmsU
	E+yCUWO/JINsklmqr7LCYqTnHGhZS7QhaqKhkEs=
X-Google-Smtp-Source: AK7set/hbAUIeRFf7vEmDRrJAvTgRdEClUK/xn9DykWC9alacrgZNdX2P3lXDER15SOMbwcxFZDK3MBZ2ilktPOQJE4=
X-Received: by 2002:a1f:ab44:0:b0:3ea:53b8:7b08 with SMTP id
 u65-20020a1fab44000000b003ea53b87b08mr274582vke.37.1675758109443; Tue, 07 Feb
 2023 00:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20230118084025.2898404-1-chunyan.zhang@unisoc.com>
 <41fd5c2a-9fc5-8af8-b66e-45bb83b24179@linaro.org> <CAAfSe-v3VW_sE4FwjURoOapMXrGavOK0hzeU-84-U_6xfhYbQQ@mail.gmail.com>
 <b3b9d515-20b1-62a1-3243-b1bc36c306df@linaro.org>
In-Reply-To: <b3b9d515-20b1-62a1-3243-b1bc36c306df@linaro.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 7 Feb 2023 16:21:13 +0800
Message-ID: <CAAfSe-tiF4--dYuKWgHUm52bMX3uSwxvWKKNRd=DFJTZZ=1x8A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Add support for Unisoc's UMS512
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Chunyan Zhang <chunyan.zhang@unisoc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Feb 2023 at 15:59, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/02/2023 03:19, Chunyan Zhang wrote:
> > On Thu, 19 Jan 2023 at 19:40, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 18/01/2023 09:40, Chunyan Zhang wrote:
> >>> Add basic support for Unisoc's UMS512, with this patch,
> >>> the board ums512-1h10 can run into console.
> >>>
> >
> > [snip]
> >
> >>> +             ap-apb {
> >>
> >> Non-unit-address nodes cannot be mixed with unit address ones. Something
> >> is wrong here.
> >
> > To make sure I understand correctly, did you mean non-unit-address
> > nodes shouldn't be the parent of unit-address nodes?
> >
> > Does that mean the bus node should have a unique base address like:
> >         ap-apb@70000000 {
>
> No. I mean, run dtbs W=1 or dtbs_check DT_SCHEMA_FILES=simple-bus

Ok, I will fix that according to the report.

BTW, where can I see what W=1 means?

Thanks,
Chunyan

>
>
> Best regards,
> Krzysztof
>
