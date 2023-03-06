Return-Path: <SRS0=5WGS=66=gmail.com=zhang.lyra@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDF9C61DA4
	for <soc@archiver.kernel.org>; Mon,  6 Mar 2023 07:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6EFAC433EF; Mon,  6 Mar 2023 07:33:26 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 533E5C433D2;
	Mon,  6 Mar 2023 07:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 533E5C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id x1so5769216uav.9;
        Sun, 05 Mar 2023 23:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678088004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwT3eldxo/iPkI6KVTduFAN5XrNMFKHna3JySQ6zjpg=;
        b=UlbV2lIFjWa2GbmRsXwvUfabN12EMRWLp5vigUKs7Zb/+0CVmvtVjJskLmRyMjAv+T
         X9wP2JBMF2Im7B+0Azpb3wcP2nOwac+DuFXQnQq3HOD05caNSvz0KF06t5l4EOma555l
         XJ9L9ZlMfNTY1TeX2YXyDNpFx491B1sTv9hL3YlCTUjY7wKImKanN1c5WP5gh1pJFfS/
         RYLQ7bLME0QNtRKsUtwh0TgcsPgQ0bs4eljI4+qUxhhZ6NG9iNwkNg1uI/sXQiEKhVOT
         zXnWGoVcXB+1yBffe6NPUkums0oAdC/9+TvzpLL9a1eg/jqNmeV1w09+1tzpTHcikeDF
         1xtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678088004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwT3eldxo/iPkI6KVTduFAN5XrNMFKHna3JySQ6zjpg=;
        b=taZTcXy72FceYA/7Z0ukHRR5qUQaChGxkvQNQs2u7iIn/ke+bAJsq0qWxnXXZ5Nq2v
         EVVhZ0dZmJJIWo3VWHIOcyUgBlA0Bpo2mYs7n6iGYUpyElkhXxrg1p0RvS5h4J2bsiG+
         U5fm7ZUolE5k4tFg3GRq0V0utsjI1BcksP4f2Ra/XRBs3uNMOB6+/u8S/XmQfYuIluz1
         8F3QpSP2JNlJ25jss6ehgRn6HsmFVfdqfBbDmJtzenrB0rz19sfo0NI7md4zWJzYfAqh
         e+RVZdyLOs0vegMUlyPQaeKccl0pNtGNb7Bot21dLKhxrzFhOZay/lRTjYxsx+/rrWCO
         05/g==
X-Gm-Message-State: AO0yUKVubS0A38NsZLGv+G17l+4aocH4NRjnPjUKdJm1tqE1fQ6nIDve
	xEAhaTIjSWn4nIuwHeWx1l01pA/AJRChDLndtQ8=
X-Google-Smtp-Source: AK7set98sNsa3iImK3NXtj2PY5UoUo0QqQyGXvqndN7K7nelgRBglTlvrpxQ0H4twZHpNASiQRcJqMGtXBw4Q/xdVvY=
X-Received: by 2002:a1f:1888:0:b0:401:8c72:4cf4 with SMTP id
 130-20020a1f1888000000b004018c724cf4mr6264627vky.1.1678088004199; Sun, 05 Mar
 2023 23:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20230306060446.414986-1-chunyan.zhang@unisoc.com> <fecb3d5c-86b7-f052-6cba-f92b45714665@linaro.org>
In-Reply-To: <fecb3d5c-86b7-f052-6cba-f92b45714665@linaro.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 6 Mar 2023 15:32:48 +0800
Message-ID: <CAAfSe-vNR_c-Uf9_Yay6rC63s3EK2dQs7G2jd6qp+u7SCmB2xQ@mail.gmail.com>
Subject: Re: [PATCH V3] arm64: dts: sprd: Add support for Unisoc's UMS512
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Chunyan Zhang <chunyan.zhang@unisoc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Mar 2023 at 14:43, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 06/03/2023 07:04, Chunyan Zhang wrote:
> > Add basic support for Unisoc's UMS512, with this patch,
> > the board ums512-1h10 can run into console.
> >
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > ---
> > Changes since V2:
> > * Removed redundant gpio.h from ums512-1h10.dts
> >
> > Changes since v1:
> > * Addressed comments:
> >   - Removed earlycon bootargs;
> >   - Moved up gic reg as second property;
> >   - Moved two sdio nodes under to the apb bus node;
> >   - Renamed node name of all fixed clocks;
> >   - Fixed warnings reported by dtbs_check.
>
> Please always mention  under --- why you do not send a binding for new
> board compatible.

Actually, the patchset including dts and bindings changes got merged
before, the dts patch was reverted due to compile issue[1] at that
time.
And after that I had a very long holiday, so resubmit the dts changes
after such a long time.

[1] https://lkml.org/lkml/2021/10/11/1349

Thanks,
Chunyan
