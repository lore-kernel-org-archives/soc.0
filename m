Return-Path: <SRS0=zTxR=RI=gmail.com=stano.jakubek@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D7AC433F5
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 14:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D6C5C36AEA; Thu, 23 Dec 2021 14:44:12 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0889C36AE9;
	Thu, 23 Dec 2021 14:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0889C36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id j6so22175988edw.12;
        Thu, 23 Dec 2021 06:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=Y6HKwPC6DjAMqeX8HR858hunWd2fFPpLR+z2PX/mMB8=;
        b=R3cWSJMAl3wNEBFA1/YJtKa+Cvcmo53dWvU2qTJx+fXLhCEVW1XKybBlwnjCrXS2D6
         xJYIuiV/knrvU2qYXK5iQL1ZsbJawR1m01Pn+L7pCBZru/xP0m35fQy4f3X3jPH7EPpZ
         Uje5JE34MBY+33vH31XMXyJar9tmkvJedNa0BUCmahyJsu5PhcavTp3Rtm2oi0YnsqyS
         6mu5mWQiITDXSTGGOcwjpToo8uLgoZjxhDWUxTdDbPqmYyQWMZKLKIocqUKKeVc9/WU5
         hWqY/wPWKI9mAFkm0x26yj3r+cS2AeYmzOKd87wrC1ZtnlANP8jmlczAkXTN3yPOszl3
         8Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=Y6HKwPC6DjAMqeX8HR858hunWd2fFPpLR+z2PX/mMB8=;
        b=FJr6pKASB4XhAjMgk9M3/jAba7rNbWrJ1uSabQckWLSeajltefUPI4viiAxyDcNrM/
         Qtb6d+Hlmb9hBN/Uvj/Isa4cTZVzkfzmgtQpx713CJqiz2uPRaT/1HW9TEz+htxaDbNf
         ldgkGPLikOhDgUHFuJsg4/woWy+8RhtaDy1DjdWnncb/oDB/njA+VHtgTnzAzr/2w1f2
         4mhmkT6cuWPQ81ZGJazMzPWCOUGjykti6Zz6/bfB4VfmKdvh6eZgUiIsN5mQ0hpl1F2I
         BrcyFqdMUetonT0lJWLwE8ingHnXelxunP0OVRGAUhiQjgwGouY77dBKemkLkP9Ep0dp
         t9kg==
X-Gm-Message-State: AOAM532E2JBHa7xCcesyFf/va0JxwK42hhRcTuODIHWt6vJEB5J4PP5S
	OPZLPs70ITwUo6ShZ9di9lo=
X-Google-Smtp-Source: ABdhPJxJMVmMIWzbe/OhVCW6laNXPBvuyepul4fTOMhcYemBst6k9WKlC5I86G0CXSk2huD7933Z3w==
X-Received: by 2002:a17:906:2192:: with SMTP id 18mr2066992eju.635.1640270650213;
        Thu, 23 Dec 2021 06:44:10 -0800 (PST)
Received: from standask-GA-A55M-S2HP ([188.123.115.255])
        by smtp.gmail.com with ESMTPSA id qt5sm1769086ejb.214.2021.12.23.06.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 06:44:09 -0800 (PST)
Date: Thu, 23 Dec 2021 15:44:07 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: bjorn.andersson@linaro.org
List-Id: <soc.lore.kernel.org>
Cc: agross@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	olof@lixom.net, quic_vamslank@quicinc.com, robh+dt@kernel.org,
	sboyd@codeaurora.org, soc@kernel.org
Subject: Re: [PATCH v3 0/3] Add devicetree support for SDX65 Modem and MTP
Message-ID: <20211223144407.GA6503@standask-GA-A55M-S2HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163960723735.3062250.7838330411965052999.b4-ty@linaro.org>

Hi Bjorn, it seems to me like a patch similar to Patch 1/3 was applied
some time ago, see 61339f368d59d25e22401731f89de44e3215508b, and applying
this patch has caused the compatible to be documented twice.

Stanislav
