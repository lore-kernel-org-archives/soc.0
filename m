Return-Path: <SRS0=KTsm=3H=dabbelt.com=palmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FAEC4332F
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 16:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7829AC43145; Mon,  7 Nov 2022 16:46:07 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47CCAC433D7
	for <soc@kernel.org>; Mon,  7 Nov 2022 16:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47CCAC433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f182.google.com with SMTP id b185so11156011pfb.9
        for <soc@kernel.org>; Mon, 07 Nov 2022 08:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :subject:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EW0pwjVNjZMsjQ4rgo3AByKUdX34ffUMtNXivNYRjZU=;
        b=iuQvd/SY4HMVO8eh2FDeRfmuFXB/dftHBIq6vItZQH6zH0DpbIYvd6ahKEbkfa6Yb9
         aHkAKJ2Xe0oaoAwLXjHJy7GQ/oFQ1iRT9NkvUfKe0SypnzjNam7WX1+5yAYmjvtMPd4A
         w339N/bXvC5+Y1UNy69e8BTYAzGEp4juIK6QiXIzpIa6dT93V0riYBdXXr08avijqhLd
         /hMDJcuYAX0YEVoh+0F9I3NJlHGazT/N7Cf3dGx0+vsnDZKKih8QvkjbEcG2dZ3Y58dj
         AY2EzYWWRNjUPn1WlzI6eKz3z0qYdViUhQ6fRY+qL6hUbMy87RUql2ZSP9KP9VadghCq
         /MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :subject:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EW0pwjVNjZMsjQ4rgo3AByKUdX34ffUMtNXivNYRjZU=;
        b=3Fi1SXk1q1aBOo5L+Et3bZ23jLXg2B55CLAoplMHOiqbWlQApHirSr24cYzz+SLADs
         T4iwAhlguLjEU8QDYDCuSnRTi8xPIHUpAowVBoulcmSy0gr//XfjkpV+TdmRvuX6l2Kp
         DsE6LgwFeEoAIR7qmQKWNlByJKfGAXJytorNv4Qw5J/ox7fhRf2GIFZZ78rswHkA8e90
         /hHYNwDQQW4jk5DAbkep/cY26LD/d95Jy8RMN48lat9lLCqKfWwUYnGI7x0QOhDLwrZ5
         9KsyiBTQvb8UY6OA9rn9ss3QvHLyYeRe5nIDkeyJawsJndBIiiYRM80aodnrbVZHsonp
         XCPA==
X-Gm-Message-State: ANoB5pmChVLBVxqasxXVaYQUaWd+ajOQzrl8wEJC5pV4vKp6pK9jpKOR
	BchdZijLqH+A/kT9zLxraQwXFQ==
X-Google-Smtp-Source: AA0mqf4UDNIhvzVyN78Jom0q8JlAl+vfEHjgjMMkpb8O8b73d196gzQo4lTFKPuP0naElUpZOTx2mQ==
X-Received: by 2002:a63:ef56:0:b0:470:6c2d:64eb with SMTP id c22-20020a63ef56000000b004706c2d64ebmr7236342pgk.49.1667839561438;
        Mon, 07 Nov 2022 08:46:01 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b6-20020a170903228600b00186b0ac12c5sm5207034plh.172.2022.11.07.08.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 08:46:00 -0800 (PST)
Date: Mon, 07 Nov 2022 08:46:00 -0800 (PST)
X-Google-Original-Date: Mon, 07 Nov 2022 08:45:59 PST (-0800)
Subject: Should we merge arch/riscv/boot/dts via the SOC tree?
List-Id: <soc.lore.kernel.org>
CC: krzk@kernel.org, masahiroy@kernel.org, mkl@pengutronix.de, davem@davemloft.net,
          linux-riscv@lists.infradead.org, soc@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>, kernel@esmil.dk
Message-ID: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

This has come up a bunch of times, but I don't think we've ever really
made a decision.  Historically that's not been such a big deal because
the RISC-V device trees were pretty inactive, but that's changed -- both
because Conor has been cleaning everything up, and also because there's
a bunch of SOCs showing up with RISC-V cores in them.  We talked about
this again at plumbers a few times, but Arnd wasn't around it person so
I figured it's best to just start an email thread and see how people
feel.

A lot of these new SOCs are based on Arm designs and the device trees
very much reflect that, so it makes sense to me to just keep the device
tree merges via as similar a path as possible.  IIUC that happens via
the SOC tree these days, so it makes sense to me that we start handling
the RISC-V device trees that way as well.  That would make things easier
for contributors, as they'll have one workflow for all their SOCs, but
also easier for me as a lot of this SOC stuff touches bits I really
don't understand and thus get kind of lost trying to review.

Arnd: looks like you're handling most of the merges these days so this
would be increasing your workload.  I feel kind of bad just dumping a
bunch of stuff on you, but I think at least now the RISC-V DTS are in
reasonable shape so hopefully it's not that bad.  It'd certainly help
things on my end, and I'm happy to try and re-direct some of that saved
time to helping out in SOC land but I'm not sure how well that'd work
out in practice as I'm pretty buried.

On a somewhat related note, Conor has offered to pick up the otherwise
unmaintained RISC-V SOCs.  That's sort of its own discussion, but if we
change over to the SOC tree we might as well just do everything at the
same time.

Presumably we'd want to adjust the MAINTAINERS file in a handful of ways
to make sure patches end up in the right place.
