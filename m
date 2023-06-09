Return-Path: <SRS0=ceSY=B5=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598A2C7EE25
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 08:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CC9EC433EF; Fri,  9 Jun 2023 08:21:29 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4DC0DC433D2
	for <soc@kernel.org>; Fri,  9 Jun 2023 08:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4DC0DC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30e53cacc10so1011839f8f.0
        for <soc@kernel.org>; Fri, 09 Jun 2023 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686298885; x=1688890885;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2dCiIKa1CN1LCvEj7Hvf0DLqYazkbxrnT1sTWjQkiw=;
        b=TFlniBTCzmmgJDIyTknroLwWTqUOsCnmSAU6ltTEY4rdLdPXgjpwf6Bi5RCpzyYlhB
         nAuUwwIG6eaKkFO2KhytHIyjo0LVDNliR3zF1jkdkh9/peJIFVQidFwM5JsRAcMQkygL
         PdY+AxPK2cp70ZMomp7sxrRAhqdGluxoTS8ShSv9IEbuLC+UfQ4v+9E4M5PEw14P2KL2
         ZWbA2nb5cH2xKZx0N6YVLl1Z/805vy+RDZ0t9LHf6Pc8BDk9YiugJKtQ1ZN3V8954YPv
         DsjBjaRlMo2Qp+i1/nxPD1+l3dfyh/U6vuyfSO8UD3zR+rXYneQWU/GSHaI8t6t5NM8C
         5bsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298885; x=1688890885;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2dCiIKa1CN1LCvEj7Hvf0DLqYazkbxrnT1sTWjQkiw=;
        b=JRwgs58XWAXdO4FVcHQ/3vuRi2/f15Gthn/3j6hUUdYy45f+hj0wpeba2vpNX8f0AY
         zQDKuSHOfg3W+Pds+XWnDqG5SmDuMpRKBkOxQ7yCq/+fMMiAaYUa4L8mjTq37dIvpleA
         Z26QkWs/iALX9e+4s0ac25y0LK3q0m/TTpQb77nnSQKO7e3xQYZj1tXCbvX6jeS628iA
         y9VYN1gErybWibRSZMBBTSJBM7vZBlek8svEsMsweowstcyWYipcIQu+H5Bcg0O1ajuz
         iMTW59y4BoP2fC1sDEsTVM/sQF90JVhgQKKNAOS2OVLoL5hnVPdG3PLlfm8r7JtZcHp4
         Ax0g==
X-Gm-Message-State: AC+VfDzfEom8eP+4tMp29EALi64h4GiFmGQNSqrIKRYrs5lAlotfeD5c
	bDCQ9O8N55GcSCFlCCFIewjqWC1c4NEkmY8Scm6pow==
X-Google-Smtp-Source: ACHHUZ4ttO6MVveZfyexVyvtG8vcoEDYBfmIpZ/8qqr4erVn6stbdF9GN/nj+HcroZ8jJKsaRHEgtQ==
X-Received: by 2002:adf:fa88:0:b0:30e:5efb:a108 with SMTP id h8-20020adffa88000000b0030e5efba108mr304721wrr.12.1686298885316;
        Fri, 09 Jun 2023 01:21:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c40:3a0f:b23:350f? ([2a01:e0a:982:cbb0:5c40:3a0f:b23:350f])
        by smtp.gmail.com with ESMTPSA id k15-20020a5d6e8f000000b0030e6096afb6sm3803575wrz.12.2023.06.09.01.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 01:21:25 -0700 (PDT)
Message-ID: <37e5de2f-47f1-a3f3-f1e4-4a304192e556@linaro.org>
Date: Fri, 9 Jun 2023 10:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.5
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changeset for v6.5 with only:
- initial DT for Amlogic C4 SoC based AW409
- missing cache properties

Neil

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.5

for you to fetch changes up to 02310be6f080071e1b9e2021fd6dd655bd842aad:

   arm64: dts: add support for C3 based Amlogic AW409 (2023-06-09 10:15:46 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.4:
- Introduce initial DT for Amlogic C4 SoC based AW409
- add missing cache properties

----------------------------------------------------------------
Kelvin Zhang (1):
       dt-bindings: arm: amlogic: add C3 bindings

Krzysztof Kozlowski (1):
       arm64: dts: amlogic: add missing cache properties

Xianwei Zhao (1):
       arm64: dts: add support for C3 based Amlogic AW409

  Documentation/devicetree/bindings/arm/amlogic.yaml |  9 ++-
  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
  .../boot/dts/amlogic/amlogic-c3-c302x-aw409.dts    | 29 ++++++++
  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 87 ++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  1 +
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  1 +
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |  1 +
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |  1 +
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  1 +
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |  1 +
  10 files changed, 131 insertions(+), 1 deletion(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
