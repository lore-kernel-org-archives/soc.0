Return-Path: <SRS0=VDpE=F7=dabbelt.com=palmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BF1CDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 20:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99991C433C7; Tue, 17 Oct 2023 20:20:31 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB181C433C8
	for <soc@kernel.org>; Tue, 17 Oct 2023 20:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB181C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7781b176131so62735485a.1
        for <soc@kernel.org>; Tue, 17 Oct 2023 13:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1697574027; x=1698178827; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8cW9ID9EmRaqAP0KD7ZrNU0hcrtypKLPEuHrHMnWGw=;
        b=Qr8xEwDZIe/9iqCKJBD85Tq/6F5E8UOnGG4NJtmMelAfaICl5/fR9UAs9T/hXCDVuV
         D6VMv2p9KhhghXod4gYH0OVMkZhzi2Cke2VEJ3fdexlZ2bt4Lgfg5TM6jDftJhshxlUU
         QIaCvKnOf+Wh9p57JCg/8yyuP9ns6aBZJOqu+rdEjdCDpsPSXHKkokRBFHoeKbN1l85y
         xrriQzPCjwq4aKoMNTpa29o7lAp40DdZzfL2DnIxPz+3e+BY4wwoDUwT2mte+i5qe96D
         qZN7xtn/lpTVJLklBHj0ZYPqSX7QxCAUS/5TA61nOpVyNxuqKf8tGCEPTk1dkmPo5puv
         P2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697574027; x=1698178827;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8cW9ID9EmRaqAP0KD7ZrNU0hcrtypKLPEuHrHMnWGw=;
        b=MHv/KDD+NsCJQ3ehG3bxf1hhJAV9YcEC1TGr2+nCEPp/nnNaYC3yZu3YlNZT51BxN1
         FJ24kkdlJeF/pf7aWAhJyrMC4V87vI98r48aw3M8CECzMdK643DpqAUNw8cqe0rfrFiN
         lBqxsW8+RTFco1JYMKM71oyKbtqlQA6K4SEGejFZcSavMsSSJ6LU5OguXSLYyN6DrhOl
         Sswfy6zC3t057zLTxZZblMqxe8PEk1L0YsJOEDYchIxp2P7VrI1ULVMdTw6YDqBkNrtN
         V7Q9jMxkNlv0wwxzHxddoQumy6J1Guz7BCR9cTDfgYefSSAiXUyJ9iKMtBHI9fcXEJDz
         vBJg==
X-Gm-Message-State: AOJu0YxNbqs0fiWKTAof6RvlSyUn6XdQfnbtDaTwv5oPVHCWA6tcwPWU
	qj33VFR7lj1wSwJ2714svedvnA==
X-Google-Smtp-Source: AGHT+IGBdwLL1rTJz7m72BA4cEO0GhgKNcA1DZZYX304OW5yBY337OahOIU9yj8GTdS5m16s4rvohA==
X-Received: by 2002:a05:620a:3195:b0:76e:f5c5:1bac with SMTP id bi21-20020a05620a319500b0076ef5c51bacmr3565791qkb.48.1697574027422;
        Tue, 17 Oct 2023 13:20:27 -0700 (PDT)
Received: from localhost ([208.116.208.98])
        by smtp.gmail.com with ESMTPSA id t27-20020a05620a035b00b0076cda7eab11sm918216qkm.133.2023.10.17.13.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 13:20:26 -0700 (PDT)
Date: Tue, 17 Oct 2023 13:20:26 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Oct 2023 13:20:23 PDT (-0700)
Subject:     Re: Covering DT build in -next merge
In-Reply-To: <ZS7rlTZLr0m1OEv8@sirena.org.uk>
List-Id: <soc.lore.kernel.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
  linux-kernel@vger.kernel.org, soc@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: broonie@kernel.org, Conor Dooley <conor@kernel.org>
Message-ID: <mhng-9d3c8241-8749-4b5e-bb01-64cf5e2d0bb8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 17 Oct 2023 13:16:21 PDT (-0700), broonie@kernel.org wrote:
> Hi Stephen,
>
> I was wondering if it might be possible to add DTB builds for relevant
> architecutres to the -next merge checks (everything except x86 AFAIK)?
> Some current experience suggested to me that it might be helpful for
> bisecting problems found in testing, breakage building the DTBs causes
> hassle since where they're used in tree DTs are required to boot the
> kernel.
>
> At least for arm and arm64 the DT build is quick enough to be negligable
> in the context of building the kernel itself so hopefully it shouldn't
> add too much load to do this - it's just adding a 'make dtbs' (with
> appropriate cross build options) to the kernel build.

Pretty sure we're in the same shape for RISC-V these days.  +Conor, who 
would know for sure (as he made it work).

>
> Thanks,
> Mark
