Return-Path: <SRS0=ceSY=B5=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ABDC7EE2F
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 08:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC6CBC4331D; Fri,  9 Jun 2023 08:20:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15620C4339B
	for <soc@kernel.org>; Fri,  9 Jun 2023 08:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15620C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6d38a140bso11340535e9.1
        for <soc@kernel.org>; Fri, 09 Jun 2023 01:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686298820; x=1688890820;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEpeYdYoJgKJrTBZbzUOxN9h/0+i+ldA1liMqmnM070=;
        b=IttHGdBwKz5BzftTq7a9nYdXDVtfdpiBfvPla8H3kLnaAjRiP8Ccy4bUCKgCsP4f2W
         bNCY0kOQ5dZePkLrw+IvcsLMa30rr67wHpgpSfBVxKf4NW9LfPV/avOa5uf3hC/JOH8N
         f9he2j5aq5z9m2wbYUixDgDw5MR0cdld3ip9BhysdphI/YSYFnAWMwtiCoLIolfnDJXO
         zJdozKdqwtRMPIsR8M8SZYxRh95DtX4c85Yk1tTf+1MMJXGJRJYhguro/GqIO26Elmcd
         4TSlg+XR050+becIr20JY6978SYUDWpRNg62bA+KqsCs9MEwkvDYQg9XbvQUNxBlY+jB
         9WQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298820; x=1688890820;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEpeYdYoJgKJrTBZbzUOxN9h/0+i+ldA1liMqmnM070=;
        b=XI9fkFF/31+aihyFNRB9V5niKj3od7bREXwqf+3QUKyT872ZmtxDvTn1G3oeXAeZQr
         kbqLSvlPz6Y/qsT1K5A6L5fp6+qO6C+49eFURYzQrSgFdxOBIUfz2ziegsuDtOv8vsFJ
         YrE17qoY7GwarQhuWni5yYZZmDbx52HiN+R97UNsBcvyVTBJPHeDjuReZSWhQnSdh7zf
         wLojGN3iepNthLC6I+UgDnCZmxZZWQzFXm7PYx1gkJv6ItqlFl3Lde+kb/WZ3t99U9ed
         g+CFyOR10bSygCvcJCjmYF54EsFOrOVXePO/BzDY2PVAfM9zlyL5/Jylexc2zwzVSfhQ
         Ka0Q==
X-Gm-Message-State: AC+VfDyvyXM0MowfPgGu6EAa/+EbNkOPF+4j6SM6qdsmxABqbqB5J53c
	GRvpw52wszVswSgiRozfkpYvsEOOFjnkSQQNBSO0PA==
X-Google-Smtp-Source: ACHHUZ4xQ78rpXA/cCsZSZIGl793WCOnbBE3tBEvgXDFKj/vrsvd+jWt1RkmRnDyLIDZaP2G0jasQw==
X-Received: by 2002:a05:600c:3508:b0:3f8:651:4b37 with SMTP id h8-20020a05600c350800b003f806514b37mr757080wmq.2.1686298820025;
        Fri, 09 Jun 2023 01:20:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c40:3a0f:b23:350f? ([2a01:e0a:982:cbb0:5c40:3a0f:b23:350f])
        by smtp.gmail.com with ESMTPSA id y17-20020adfee11000000b0030af05fce4dsm3784765wrn.77.2023.06.09.01.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 01:20:19 -0700 (PDT)
Message-ID: <21b55df9-3eda-0a0f-cf76-79b1d7735314@linaro.org>
Date: Fri, 9 Jun 2023 10:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.5
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic ARM DT changeset for v6.5, with only simple low priority fixes.

Neil

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.5

for you to fetch changes up to 98b503c7fb13a17a47d8ebf15fa8f7c10118e75c:

   ARM: dts: meson8: correct uart_B and uart_C clock references (2023-05-31 10:55:46 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.5:
- correct uart_B and uart_C clock references for meson8 & meson8b

----------------------------------------------------------------
Martin Blumenstingl (1):
       ARM: dts: meson8: correct uart_B and uart_C clock references

hfdevel@gmx.net (1):
       ARM: dts: meson8b: correct uart_B and uart_C clock references

  arch/arm/boot/dts/meson8.dtsi  | 4 ++--
  arch/arm/boot/dts/meson8b.dtsi | 4 ++--
  2 files changed, 4 insertions(+), 4 deletions(-)
