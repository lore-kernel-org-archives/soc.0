Return-Path: <SRS0=8y+7=XG=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B4DC433EF
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 08:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C978AC3411E; Fri,  1 Jul 2022 08:10:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AAFECC341C7
	for <soc@kernel.org>; Fri,  1 Jul 2022 08:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AAFECC341C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id g39-20020a05600c4ca700b003a03ac7d540so3216424wmp.3
        for <soc@kernel.org>; Fri, 01 Jul 2022 01:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:subject
         :content-language:organization:content-transfer-encoding;
        bh=PEvEMy93ucfW13yHE94YOmbNRns7+Ib4NBPXZ7XvoEw=;
        b=Mt1RuHzngbB+zqsN2kd3N9qgMKxQd8fSXs0VW3SVr+idWjDX3a43uW9ybY23sRfk8h
         WnAykZv8wpeqmfwaAQizocN5GbJWqO9ODFDzqC5Wo82ylW+X9pFpi9eZZ6dtRSo3hdH7
         JnEBlJwj7Wlg0daMOi0bYNPwOHxr16gPeXnk41ElhOydvflUfkVqBSaMkmnHsLk44u8i
         CNFukCsm7KSqBrAL8pD1y46qq9Kslq8whJl+lelvcdljD9zJ2Dy5VAyULjAl1mXfIgT6
         W6Q7fUIP1825C8EzUUY2ia0PrjGyzw1fpzOWCQ2a0XScjtyhWBPW+RarE79lfrOb7tc4
         roTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:subject:content-language:organization:content-transfer-encoding;
        bh=PEvEMy93ucfW13yHE94YOmbNRns7+Ib4NBPXZ7XvoEw=;
        b=ti50CTWR7IKcCHUdl11G5RBzk0r4W3VM8OchzIZOYjU0BzVLClHFiOy6GRFPFPpdts
         8sn5vjhjFT1wEAm1mi3TV5yGV1Aujarpa9QLNQwqhhlgJyLmYpahMcUFxJVODOFfcWrk
         /7cZWnfLtf6puu4NiQ7F1vGrUJ7v+qiSHDZkQ9TgEAwTEJMPKTXwRBipD0d+AveS6kjF
         Iwn59j8Q6OnL+9NGfIF/eOBlKTT9VZ9rw31HjUUsPMkWa0bQTyKsQ/D5N7QVp/r+wZTw
         UnHPoUKACEjnf9Kupuf0c0bOd+LV/5mDEnhLa87HJf0N3Gwpb83cUKwGi81ih75cW8sB
         b7+A==
X-Gm-Message-State: AJIora9/QFniS9250RI5/w5UwX+M5JZHMStIax7ZYlmB0p+h8j+Fa1v6
	v/IHQhtzSkYHqdZ3NSekmhgmJh3wePgYZ/Qe
X-Google-Smtp-Source: AGRyM1trCN/aqUGFns0X8+n21lgxvxmp5/Y0AmRjGUhA0XB+qgR6KYewyfaRVQiJSZInBfkaqKIj9A==
X-Received: by 2002:a1c:e907:0:b0:3a0:3e42:9c72 with SMTP id q7-20020a1ce907000000b003a03e429c72mr14806896wmc.162.1656663055560;
        Fri, 01 Jul 2022 01:10:55 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5d81:390:1737:2a33? ([2001:861:44c0:66c0:5d81:390:1737:2a33])
        by smtp.gmail.com with ESMTPSA id f2-20020a7bcd02000000b003a0499df21asm9748688wmj.25.2022.07.01.01.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:10:55 -0700 (PDT)
Message-ID: <51034acd-13db-5c25-7b9f-ff87537406bd@baylibre.com>
Date: Fri, 1 Jul 2022 10:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic ARM DT updates for v5.20
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic ARM DT change for v5.20, a minor whitespace fix.

Neil

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v5.20

for you to fetch changes up to c110f7a94015a8da24520c5f460dc461ffc30a34:

   ARM: dts: meson: adjust whitespace around '=' (2022-06-10 08:34:15 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v5.20:
- adjust whitespace around '=' in ARM meson DT

----------------------------------------------------------------
Krzysztof Kozlowski (1):
       ARM: dts: meson: adjust whitespace around '='

  arch/arm/boot/dts/meson.dtsi   | 4 ++--
  arch/arm/boot/dts/meson8.dtsi  | 2 +-
  arch/arm/boot/dts/meson8b.dtsi | 2 +-
  3 files changed, 4 insertions(+), 4 deletions(-)
