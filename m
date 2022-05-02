Return-Path: <SRS0=iIJx=VK=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A82C433F5
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 13:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE003C385A4; Mon,  2 May 2022 13:04:02 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E318DC385B1
	for <soc@kernel.org>; Mon,  2 May 2022 13:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E318DC385B1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id i5so19474852wrc.13
        for <soc@kernel.org>; Mon, 02 May 2022 06:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:subject
         :content-language:organization:content-transfer-encoding;
        bh=l+lpIwlmpEOw72PQ9CIZhCPxkquv1lxYpNRC1XaOcPU=;
        b=ICMtMZ9QzKGXFRJJidQO/GVnfdp5ZFfvTZV9WP7loDSneiPKFZf4qNNhrSxOkHZprU
         eEFYE/og+pCCzV047mhXkMEv81G5bl81m551FwRGjtzV5dc6WTaGP+qMvNtNxrTOZNCh
         /sAMKvQhuQm9zeHKAuV1peTR5KGBWh9QyLdOmiMRcRyAYJJW/qiNCJ7tYYKBu5MzhiyY
         6yDwdrKfgcPshYyC17eapYIg+Y8YYhJJ75eVkhGeTxvuB4HLG9QZaqgXFeKpEkPFGvy3
         9jzWSKixrgM5KV8ElyWjWK9dVYHb45T4xFQvVaHQIIH2jqc/EkzaQb6pfy3dRonfwgCb
         rQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:subject:content-language:organization:content-transfer-encoding;
        bh=l+lpIwlmpEOw72PQ9CIZhCPxkquv1lxYpNRC1XaOcPU=;
        b=HZNsaF39UAQo8hg79djSEOX0ymo4JVh9H/LzfgVLfQqG3gOy0bAc9JiUWgNuZQTqDC
         9ulkhPyEjuGwGK3c55+saDue/Ah1BXp0YWgTywqKATAQmmEj0zNg9u4CNgAvpZ16DFpV
         L0haPiT0z6oeoVMU9McyHlvbWl4Vf+lfM9ErSJjkne/Q4hdOBco0xSQl5odDydEMxBdW
         c7SxRMWSH2wHA9xY5QWn4nW9b0LvBv/piYkSSVl+qr2DgBVBVXFghG66air0YcTar6tv
         VmWo0rldTw76BwQSOO7IlUL9iBRVVcGjP7HPVUl2kDaa6m9O9OJHsLrzKFIQ+uOm6ZMf
         MMIw==
X-Gm-Message-State: AOAM531YgdSqyENeBHovLgzZnXGlK5Ins6U0kAvZShCfw/OAUCl03Irc
	ngwixTcmfNrNENzLgy2B+jHiZ5ksavZwgela
X-Google-Smtp-Source: ABdhPJwqyymjOyz8O/r8s4IleRuCE2K+XMrTwktTnIfPIK5VjokbKRDG3AUj2a2mCUnAFKG1cip0aQ==
X-Received: by 2002:a5d:4b47:0:b0:20a:d4b5:83e2 with SMTP id w7-20020a5d4b47000000b0020ad4b583e2mr9236083wrs.503.1651496638698;
        Mon, 02 May 2022 06:03:58 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1ae3:6f5f:320e:f969? ([2001:861:44c0:66c0:1ae3:6f5f:320e:f969])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0038eba413181sm6414908wms.1.2022.05.02.06.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 06:03:58 -0700 (PDT)
Message-ID: <fbd7cbe7-1fe9-7009-37d6-c01b15c93032@baylibre.com>
Date: Mon, 2 May 2022 15:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: dts: amlogic updates for v5.19
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a single Amlogic ARM DT change for v5.19, aligning SPI NOR node name with dtschema.

Neil

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v5.19

for you to fetch changes up to e8662d0832431a069f0138da72c638cb6a377bdd:

   ARM: dts: meson: align SPI NOR node name with dtschema (2022-04-08 09:40:37 +0200)

----------------------------------------------------------------
Amlogic ARM DT changes for v5.19:
- align SPI NOR node name with dtschema

----------------------------------------------------------------
Krzysztof Kozlowski (1):
       ARM: dts: meson: align SPI NOR node name with dtschema

  arch/arm/boot/dts/meson8-minix-neo-x8.dts | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
