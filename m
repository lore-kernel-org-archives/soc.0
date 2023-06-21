Return-Path: <SRS0=8opd=CJ=chromium.org=dianders@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7549EB64D7
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 16:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A72EFC433C0; Wed, 21 Jun 2023 16:56:32 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE0C6C433C9
	for <soc@kernel.org>; Wed, 21 Jun 2023 16:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE0C6C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9896216338cso173663366b.3
        for <soc@kernel.org>; Wed, 21 Jun 2023 09:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687366588; x=1689958588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBrF3iaP3Fd6iHn8cw7cCxGg4FZTsp6oWE22ClcY7C8=;
        b=Dw1l8Awv8LpyoGMx91gmy78/vjUIS457mDn8V8FN2qIk+fOrUs96tPSVDkuRAD+6hC
         5i0XRnGfXJ9KrqxSs0BcEsOMwhEiI3a44hDBwNqhP2+kdMJjAi1+JYXLH4ArqrkGZv8R
         0v/9S3oP3oKG5c+ZOWSDEMI3bHO24MXxWPAao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687366588; x=1689958588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBrF3iaP3Fd6iHn8cw7cCxGg4FZTsp6oWE22ClcY7C8=;
        b=SnF+sx33ZFJvPU9WEwzFF8NfXzLUvgVPPYrxaXvoF0bCnJq+upG/9X+BbZlvI6yEzw
         sgRJ8RLDM33rQ9ZSpeEFDmLsx5szT524Ccl8QL9EdNUvz9ZzeSndBWIRLyUdyF8aVxjW
         9+sgl0Pd8sQJStqkbKyjeDH0nCMO3XAL/aqqU+vM7H/qii5HzPKTwB5O9Cv0CVDJ3TMW
         k9Tf170D0K5U9iP7xvfKAPC585hUT2StlkIFVOkfP1rqa6aaOEQ3Vczfmwi3JMBFvoiO
         0DUCA6owdCynCKrsRDLamW/QQLWK9zCVAZkQeqBeCserpvqZRsLa1DBufpIVKXRT50CW
         cgUg==
X-Gm-Message-State: AC+VfDwKCSUOb2z+FYja4BRyyrflbQfNQq8dvbUNiMWbwQSEKsBiX7Nu
	xhEYdj6IHri4OPrmFwbFkfQKA3KnHRtiBLKEs7qxBrMF
X-Google-Smtp-Source: ACHHUZ5p+FXmeL9XF4rK+WsJcqyxNpfJX8+0RaxpDyeb2/ojv095jHiOV/DAyw+hluGg/pKU8pVjAw==
X-Received: by 2002:a17:907:94c1:b0:982:7d5f:f608 with SMTP id dn1-20020a17090794c100b009827d5ff608mr15077299ejc.46.1687366588477;
        Wed, 21 Jun 2023 09:56:28 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090624d600b009786ae9ed50sm3375013ejb.194.2023.06.21.09.56.27
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 09:56:27 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-516500163b2so270a12.1
        for <soc@kernel.org>; Wed, 21 Jun 2023 09:56:27 -0700 (PDT)
X-Received: by 2002:a50:9e65:0:b0:51a:2012:5b34 with SMTP id
 z92-20020a509e65000000b0051a20125b34mr630898ede.4.1687366587250; Wed, 21 Jun
 2023 09:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230616081440.v2.1.Ie79b5f0ed45739695c9970df121e11d724909157@changeid>
In-Reply-To: <20230616081440.v2.1.Ie79b5f0ed45739695c9970df121e11d724909157@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 21 Jun 2023 09:56:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqirzpMwq8wto2B9cDGVf5JfirAQRargKWcZLpFhXCVA@mail.gmail.com>
Message-ID: <CAD=FV=WqirzpMwq8wto2B9cDGVf5JfirAQRargKWcZLpFhXCVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: Document that SCM
 can be dma-coherent
List-Id: <soc.lore.kernel.org>
To: andersson@kernel.org, SoC Team <soc@kernel.org>
Cc: amit.pundir@linaro.org, Will Deacon <will@kernel.org>, sumit.semwal@linaro.org, 
	linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org, 
	linux-arm-kernel@lists.infradead.org, Stephan Gerhold <stephan@gerhold.net>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Nikita Travkin <nikita@trvn.ru>, 
	Stephen Boyd <swboyd@chromium.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Andy Gross <agross@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Das Srinagesh <quic_gurus@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bjorn,

On Fri, Jun 16, 2023 at 8:18=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> Trogdor devices use firmware backed by TF-A instead of Qualcomm's
> normal TZ. On TF-A we end up mapping memory as cacheable. Specifically,
> you can see in Trogdor's TF-A code [1] in qti_sip_mem_assign() that we
> call qti_mmap_add_dynamic_region() with MT_RO_DATA. This translates
> down to MT_MEMORY instead of MT_NON_CACHEABLE or MT_DEVICE.
>
> Let's allow devices like trogdor to be described properly by allowing
> "dma-coherent" in the SCM node.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Bindings change new for v2.
>
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Without this series v6.4 will have a regression where WiFi / LTE won't
work at all on trogdor devices. Any chance you can send up a "Fixes"
pull request with the 4 patches in it? ...or I could try to convince
someone on the SoC tree to land them directly?

Thanks!

-Doug
