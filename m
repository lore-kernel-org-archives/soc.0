Return-Path: <SRS0=euQE=4H=dabbelt.com=palmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E0DC4332F
	for <soc@archiver.kernel.org>; Fri,  9 Dec 2022 01:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83E54C433EF; Fri,  9 Dec 2022 01:24:14 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 124D4C433F2
	for <soc@kernel.org>; Fri,  9 Dec 2022 01:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 124D4C433F2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pj1-f52.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so6507981pjp.1
        for <soc@kernel.org>; Thu, 08 Dec 2022 17:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tz7/c/S2bGL3JTpjy3sYti4VzazclRNAfcMOHVpG1Bw=;
        b=S0N7VpnML01I1L6SW5KOI9DKu1LS3c6R0Et4r9F7A6PRsDs94yntO1CATXIuDiKFZ4
         1sOCVDYtNF6bYYs/nUNfWEHfevc+Pb0VPw8vKF1EfWtD2wAmWtuVfD/S14wKvKRjJs5V
         92FQGFCRvRnKfLTk/0niX+hbGFwII4uggFmPl/bP6gDRjwP2l4iGvIK0Duf7S07mHzTR
         fWlaTS4phVldfR+KVs0zfOEEJZr23gKA92YIeYOQ3twvizc2w/Rs9wyEHKzE+7FOcD8g
         pk2blLS8G/qHJCqUbjBLEWFa/qZgSmfjYEjBYcFbl6A+s2yhudwWHRykm5mGF21cxBJl
         rZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz7/c/S2bGL3JTpjy3sYti4VzazclRNAfcMOHVpG1Bw=;
        b=qIcP468qpB24zUVcqLOtg6G1u8R2GFnm7PXNxX7qgW1LFbPosKB3ELLjLXk/+iRUpp
         7phSc8GHJ/jXUJaE5dNys3JS93lBw9lE9mgbrtfITnmexXBNaP9qLQKSNEGqD3wML4SG
         WoaRSo5bCiRQKtOuXCr4BN1T0znVMwBkQP372GBB59bc29F+VbmfTzeFKxWhP76Kcr+q
         SW5PKnzjDjYr2eY/j4hVlwTCKgNMQGqWijXmHAoM5YOmou8QLMXgofPJHhkGdb1ImUEB
         8Ho8eMLK8Xa1WQ9kiHS8P2qhnEbbk4CzoaWF17tESxFMW77gxEYUiRwEmqCk1H+MLldu
         TIBQ==
X-Gm-Message-State: ANoB5pkmRhXSGMoxB02HQS13P2Y3qeNUgK0yyfBs2ByoKiB+U5R0kDDV
	teoGgfXytKBADHCjwB+HXXMOcg==
X-Google-Smtp-Source: AA0mqf5JV626aJGkuzlbbs77P4VoHR85hIo7nQXghzW7EcenLGVsWYy6WzOo5qfwkw0gro4BSmwSWw==
X-Received: by 2002:a17:902:ec92:b0:189:cbf6:9534 with SMTP id x18-20020a170902ec9200b00189cbf69534mr5222889plg.0.1670549051231;
        Thu, 08 Dec 2022 17:24:11 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b6-20020a170903228600b00188f6cbd950sm55290plh.226.2022.12.08.17.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 17:24:10 -0800 (PST)
Date: Thu, 08 Dec 2022 17:24:10 -0800 (PST)
X-Google-Original-Date: Thu, 08 Dec 2022 16:12:01 PST (-0800)
Subject:     Re: [PATCH v1 3/7] RISC-V: kbuild: convert all use of SOC_FOO to ARCH_FOO
In-Reply-To: <Y3xmZd9wqj7wGcCy@infradead.org>
CC: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
  Conor Dooley <conor.dooley@microchip.com>, Christoph Hellwig <hch@infradead.org>, damien.lemoal@opensource.wdc.com,
  emil.renner.berthing@canonical.com, geert@linux-m68k.org, heiko@sntech.de, samuel@sholland.org
From: Palmer Dabbelt <palmer@dabbelt.com>
List-Id: <soc.lore.kernel.org>
To: Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
  linux-arm-kernel@lists.infradead.org, soc@kernel.org, catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Message-ID: <mhng-c7b813c3-e38b-4c31-bf13-3c8dfd8ec711@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 21 Nov 2022 22:04:21 PST (-0800), Christoph Hellwig wrote:
> On Mon, Nov 21, 2022 at 10:14:11PM +0000, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Convert all non user visible use of SOC_FOO symbols to their ARCH_FOO
>> variants. The canaan DTs are an outlier in that they're gated at the
>> directory and the file level. Drop the directory level gating while we
>> are swapping the symbol names over.
>
>
> I still very much disagree with this.  ARCH_FOO for something that
> is not a Linux architecture is a really really bad idea.  We need to
> fix arm and not convert riscv, which got this right.

Makes sense, though I guess I'd argue that SOC is also a wrong name (but 
at least it doesn't conflict with the ARCH_* symbols that already 
exist).  That'll touch a bunch of trees, adding the Arm folks to see if 
they're on board.

I don't care a ton either way, my only opinion here is that RISC-V and 
Arm should use the same scheme.  If the Arm folks want to move over to 
SOC_* that works for me, and has the advantage of being  no work on my 
end ;)
