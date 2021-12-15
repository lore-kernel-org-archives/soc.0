Return-Path: <SRS0=6dNP=RA=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B15DC4332F
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 22:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C94E0C36AE7; Wed, 15 Dec 2021 22:28:01 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B0DCC36AE2
	for <soc@kernel.org>; Wed, 15 Dec 2021 22:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B0DCC36AE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f175.google.com with SMTP id bk14so33721408oib.7
        for <soc@kernel.org>; Wed, 15 Dec 2021 14:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vIVXiGfUpcNHajlVwayi7ZXVOYdjzHmlLf5e1SFw0vM=;
        b=ghDFVvgDJuVmeCVQaVAh45H1K8RdDeKJKREPK4B/ysZAGmKJdmRWq8tZaXfkNwdbYe
         ALWb9ezC6unB+Z9uMU3wlo8HWSNvepUvsCNh50tl2gImnBeR8msA4ondq2aiYcYu3e2L
         4OL1NPdBui+Qdd68zGLr2HYHkfuvBSipPwEyd1rEQxojTrlOGilPjSGD66eBkhb7RUvf
         doO5gN9uQGpaGyBihnAMW7EjOtyCO35WyZZm05WnVNdCV0rJpjFSuPa7Tn4ZXpT0LP7t
         iB94QX9SJ+aeA03lFThCZGB9UY9u1kDCb/vPHDF1RLwxF2WV4nk4rNFfm+Vs4jkP++j3
         YpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vIVXiGfUpcNHajlVwayi7ZXVOYdjzHmlLf5e1SFw0vM=;
        b=rLE1W/aRwRcjUe5J5DE5fwhTm3TUIk/3DrksEbvFyfunrAriLAdIBhNn5qejvdSFrQ
         /j6ZFUF0x3aEsfbP/ljopels61BwwNjFKH7Uznlgk5YeETFPawtEc0DciSbe9FNhbez6
         N7ND4gWI/OFgk8tNJzePKbCA3OnWYKHbV7NmdvU9Ky9MUs7a0g2rLfM9zFz2znqxRj9c
         QceoDygFhrjKuLr1cA4CB/l/9dabs1r6KvuaL/An0OsKPlqbmXKiGAjpM4uwSiRmMH0/
         sxMyvU0VEYVNpoNdHcDbK9y1o6WsCMdFNlKvILS5tqk8jMgPe9Faj4CR0S1LIGgXXMtX
         vPoA==
X-Gm-Message-State: AOAM533q3C9jfHVflhnsBJkS0dfTm2byj2o8wbqqayAJvlRZxS/8d8tq
	ho1CQyip30vrSZ2KUqspRQC6P8Bq49aoWg==
X-Google-Smtp-Source: ABdhPJwyLbS2ZG5HTaex00cPe5QptBuaGUGdhn0FouyMrvpYmlKxeV39hiWGUNz4eB+RvIvOBk26kg==
X-Received: by 2002:a05:6808:1283:: with SMTP id a3mr1839688oiw.110.1639607280198;
        Wed, 15 Dec 2021 14:28:00 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:27:59 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: quic_vamslank@quicinc.com,
	agross@kernel.org,
	soc@kernel.org,
	olof@lixom.net,
	robh+dt@kernel.org,
	linus.walleij@linaro.org,
	sboyd@codeaurora.org
Cc: manivannan.sadhasivam@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add devicetree support for SDX65 Modem and MTP
Date: Wed, 15 Dec 2021 16:27:32 -0600
Message-Id: <163960723735.3062250.7838330411965052999.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1635552125-16407-1-git-send-email-quic_vamslank@quicinc.com>
References: <1635552125-16407-1-git-send-email-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 29 Oct 2021 17:02:02 -0700, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> 
> Hello,
> 
> Changes from v2:
>  - Added cmd-db node to the sdx65 dtsi file
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Document SDX65 platform and boards
      commit: 3b338c9a6a2afd6db46d5d8e39ae4f5eef420bf8
[2/3] ARM: dts: qcom: Add SDX65 platform and MTP board support
      commit: bae2f5979c6e537334c9099013b5407019e88c44
[3/3] ARM: dts: qcom: sdx65: Add pincontrol node
      commit: ff8b573a6ccf4deba10285abef072c577099e038

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
