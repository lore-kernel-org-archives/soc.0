Return-Path: <SRS0=ERgN=BU=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3833C77B7A
	for <soc@archiver.kernel.org>; Wed, 31 May 2023 02:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FF0FC433A4; Wed, 31 May 2023 02:56:43 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC226C4339E
	for <soc@kernel.org>; Wed, 31 May 2023 02:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AC226C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-568900c331aso35122687b3.3
        for <soc@kernel.org>; Tue, 30 May 2023 19:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685501800; x=1688093800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l63BPFHG/8A+DlS6bj6aZarLbZJd7JSZfr8s+sxk1kU=;
        b=wzQLoolkF4+jrat6q+ubEjQngrEqfsaw/HCc1Ve9bqpxoiPtgOtB/OBpBsBE7v6tsy
         PmNAc6Sp58LnySwGc5c/HtBhKvJsTIWXL5TsmFF0L4qAJl1N2bS+y2H9WxAA7MoiahaG
         IQZgLkNBjqiFe+PzxALHR1TbsYXjtzKfOHF3UpvfJ89zoXDSFGsCqehX+rUE2RvvdT3R
         r1VbD0ZZhCjmGpNw6hVHGabrdUDLKyunklcpm/pNN4zvIdwtTSC4QJEAwX0U627+rs9/
         4LxGwcw+5HX+wpChEHfAOLMS6V1A9w1wenuB0+oSrprkYNvIuG2bldmCztyk7C+IHHjC
         9u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685501800; x=1688093800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l63BPFHG/8A+DlS6bj6aZarLbZJd7JSZfr8s+sxk1kU=;
        b=l85odMFfxSgIpvQmbGnrboTi3V+xf7hQQ+UOJRwpb0dau/YwNyN7zbOoy7nFQg1zxv
         fuy+sT2YhZmngub7xHPNUUupls5/Y5zHqJtExhFU9o7zWLkePtvC/OKNnrsXdpYtc2yE
         czJVOi63O439mKigmNuWO1zrgQwn/ZL+FbbGRvZCdEa9POBX++Bng+koVULnjNSgSMt+
         N4QkH52WyBzWPiy3Z5NTKogKfF0v7O+OO9qo4D8OzjyiknGkfbyAUjgT2KkO/PKj/YuT
         9mp+/0sYwMI/AnqFbSY/pbPdvn4yazTN5qGgF6X48NIiTaZnZnj6R0WHgZ9ADhQoYjbs
         UydA==
X-Gm-Message-State: AC+VfDxm8h8LU+zOyjSkBWtTVF4/+zg/aQf5/QX+v6plnmbUjNHiJMt5
	uduXoI7nU2jYmj2tKAB6WA5z4URwzMnMQWBBmSxerQ==
X-Google-Smtp-Source: ACHHUZ7nxozK+OzM2cHrCcQBYx9QECrpocSGlUndYud5X7WsYdFzxQhxBFPWubzuzPJkE/PoszYCKS5y+jQXk6Fg0Uw=
X-Received: by 2002:a81:6c94:0:b0:565:c21d:8ec6 with SMTP id
 h142-20020a816c94000000b00565c21d8ec6mr4823798ywc.6.1685501800664; Tue, 30
 May 2023 19:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230527040905.stmnoshkdqgiaex6@ripper> <20230528001010.47868-3-guptarud@gmail.com>
 <fb65244e-ab3b-c473-57b9-2da80e67be4a@linaro.org> <CT04D1K5GOBT.29Y5DO5HHS57V@Latitude-E6420>
In-Reply-To: <CT04D1K5GOBT.29Y5DO5HHS57V@Latitude-E6420>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 May 2023 05:56:29 +0300
Message-ID: <CAA8EJppVHW845p-JJ-9qP6x8pJz64nEN2t2Da+u=yHc6+4pyBA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: Add qcom,usb-hs-phy-msm8960
To: Rudraksha Gupta <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 May 2023 at 05:49, Rudraksha Gupta <guptarud@gmail.com> wrote:
>
> On Tue May 30, 2023 at 9:22 AM EDT, Krzysztof Kozlowski wrote:
> > On 28/05/2023 02:10, Rudraksha Gupta wrote:
> > > Adds qcom,usb-hs-phy-msm8960 compatible
> > >
> >
> > Please use subject prefixes matching the subsystem. You can get them for
> > example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> > your patch is touching.
> >
> > Best regards,
> > Krzysztof
>
> It seems like "dt-bindings:" is the subject prefix for this file. Would
> you like me to use another prefix instead?

At least it should be "dt-bindings: phy: ". However as this change
covers existing file, it probably should be "dt-bindings: phy:
qcom,usb-hs-phy: "

-- 
With best wishes
Dmitry
