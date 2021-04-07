Return-Path: <SRS0=LeP6=JE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F64C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 07:04:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C1AB61246
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 07:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C1AB61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0cbzLRNxs+da0obLnb8BAbXC74kxkCAQ32CVLtnCCh4=; b=NpYTsgkzBhXlVIOux1QCir3Ji
	20dmCS761lEuTSgaUx4nAjPlHz2mjb7Zuz6xIpaYeQlpBO/hcoFTH/i8krqEUkAZSWlTcvTJwFxKA
	j8gZsoVwQoUs3seJRWoohA6Et4uCICWB9Le8PxvZHNdhevzVvee0uU/JFzQNroGBwbSW3IIK3CQKM
	xWS0tD/4IrZrKNoAW7XjkDFQTDuyNj9YcZIEPlhZlz3oJeuoB7xJmAXD9e8VsO+qO0d8WakfkXiO+
	BH3v/fFSJ2lIpNuhYFQzYHyKjSUQKgaH4JRU8sBNxpvBAOP54Oi/ZxgJGzPGjzw1iidxIhGbk17/V
	YNmNoLW0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU2Dd-004HK5-TQ; Wed, 07 Apr 2021 07:03:18 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU2DZ-004HJc-0X
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 07:03:15 +0000
Received: from mail-ej1-f70.google.com ([209.85.218.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lU2DY-0000tV-Gd
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 07:03:12 +0000
Received: by mail-ej1-f70.google.com with SMTP id bg7so6527339ejb.12
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 07 Apr 2021 00:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EPPmWmdaq2dh/UGET3fGHk7TqyifSikdBPPTcaMQ1jg=;
 b=X01lV+XoZpENndSs1G5bB2gFrAKFdoGOr/XMBChmNXVHjeRQCc6xL/T33Y0hWfw5qv
 cdPZOiiRcmB3lHVz+0D78Fx1CeqBL8yarWeIp4vqiGSX4+4959G96khCpXwqcfRLiaC/
 oDv4/sGCJHy/fKyuc1sz+VtWx7vZ+ZOIBVXqOhK0QnOqeh07Mu2WRTVLb1AfqbIf26xf
 qQ3fa9gUElpISniy/cObEw7KZQYISlGTABhnSnFYGD42fxMbXzZQXznt1HMuDs3QBdi4
 j87/nZ0/t1wHjWtLGbB8aKsN67zoe/kRPUZOgqZcYqNZDoE1oLyAZiuN+2J38yapNWfB
 0ddQ==
X-Gm-Message-State: AOAM533UBYoE/PpN/FVcG/Xe+zodYOAthKTLOmYa1qeQHc5AEp3oObcj
 VgekCiLGM1B8+Tg1Gn6LL4zMfltvDXE4MRwzAea59lreJAXgsjDrgT0Kz3E/YSbsrt+Qr0S4X4k
 512lEorsLT9Y3qSe+M556OS2gEWGEhsuv0UHwNgMnHTVRyvfHN+WA
X-Received: by 2002:a17:907:8315:: with SMTP id
 mq21mr1978838ejc.197.1617778992222; 
 Wed, 07 Apr 2021 00:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5unwAu/pheJs7/Bm4+tsoa6su36QNc2QP3KIySluVf5OYxVWePEgyI1T1vZ5SuhSIJMwiOQ==
X-Received: by 2002:a17:907:8315:: with SMTP id
 mq21mr1978824ejc.197.1617778992048; 
 Wed, 07 Apr 2021 00:03:12 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id s9sm14384640edd.16.2021.04.07.00.03.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 00:03:11 -0700 (PDT)
Subject: Re: [GIT PULL 1/3] ARM: dts: samsung: Pull for v5.13
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <33fb7d93-a091-e1d4-e0e6-463c391b6e76@canonical.com>
Date: Wed, 7 Apr 2021 09:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_080313_320392_DB5DC134 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210407070310.z5ZEiMkBDSSCOv6d0yWrMX33te4O2N9_gTrpxnYpj9Q@z>

On 07/04/2021 08:58, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>

I still did not update all my tools for new email - this should be
"From" my Canonical address. The tags are signed with the same key with
@canonical.com UID.  The latest key is already in kernel PGP keyring:
https://korg.docs.kernel.org/pgpkeys.html

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
