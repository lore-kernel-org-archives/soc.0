Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20EAC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:31:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8686264E3B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 12:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8686264E3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uwepJUDwurrkhB6ok9CD65PM+tqjJDOV8/ryz7FljwQ=; b=uXwleF4oLq3xlo8S2fax6PN9Uj
	OJQ/eDzZiFG8zmR+UJ/ueDIMQJzp5YE0+eny+77jFDkNcpOLwWZj3uYgoEgg/NJ41kriyFetKh+sm
	rZKxx8vBKXRJ0z7qjUwNo07tFkULkZVPE7Mt4ES4d95qhRBNwxyi3Ik/dnMAP4vdPyObeqRU7x36/
	US+t+fbpIRKK0XrEW6rIVT7RlOY31NSCjpn+aBfswxjxkrSFr1GT6jjf5BLu+DLlM8W3a/jMjAt9W
	cdHE6SnsirxU0rCV/dgYUCBITkFzheCPsw75NwxQ8O/QNnCF2iJqUre5N29H0VqyE4REnTuT7VhoV
	Vc77vcqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9odo-0007iY-Gq; Wed, 10 Feb 2021 12:30:44 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9odl-0007ho-5y
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 12:30:41 +0000
Received: by mail-qt1-x835.google.com with SMTP id x3so1330989qti.5
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Feb 2021 04:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=K6Y8CEeI51JVKVFBNpZEdZAuFjEFDlhuqajn9o/8bz0=;
 b=LHvT77Xb3sRA+i67qoAcKDujAXWRnXedOh3AqlFooWQa90+us7QYqqegbJJGFfMUC+
 s3MC8V6k0EyVaMCf7qS/N/H7EKUhf+kdJfcoWmO17+kBFa2tgOg0ITZeBK4jCV14gGHM
 wepQj4Ftt+TlJH7uyCyFFlOIPLQXVXAujsiBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=K6Y8CEeI51JVKVFBNpZEdZAuFjEFDlhuqajn9o/8bz0=;
 b=QAYv/1l8fn6utMOPdyQeeeJf9V+nuW4bwAq5pJejqtx+UOiYBu7Pc+amrSVbnOapzk
 M8G2Wndsp4z0D1aYkPVsYpbqs+HMhMKeTca3aq2htV9FBKRp/HkSFoEqbth6WhJvVBh0
 OZ7CkFF2w/rX6MRzKXA9DM+hyaMxBsLsdj7rAmW/0hl0mas7h+93EnMTOBmEkWtMuEEj
 DtH7MyTPXxFZJgxypWmwBfxAOXWWpA8KM+rTk/l2zbwj13Q1tCypFTnlkL83OqCgd7u0
 +wMkaT28+NCCs6dI2wtxgszmT9M3fHM1AO3536rmdbGgjgsFEJN0UWpizEC9amMH5huu
 xOPg==
X-Gm-Message-State: AOAM530yDBbB3b5IO9Jpte+FL0w6iKlfWTPxDls+HsJgxl7Bu/Bxu8J5
 vELxjqZWAlcnJiMA9O5psBhNYIrCqEk0hfVCzPY=
X-Google-Smtp-Source: ABdhPJz4nqhjURxaff+V137RrYa6jcy7NOyn2z01tcRyGYecLPyd1UOZKfNnMC5+/A/QVwqNSy2e44EqGL/VQTWsZJk=
X-Received: by 2002:a05:622a:143:: with SMTP id
 v3mr2423251qtw.363.1612960239154; 
 Wed, 10 Feb 2021 04:30:39 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Feb 2021 12:30:27 +0000
Message-ID: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.12
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_073041_261859_662F645A 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210123027.J9NYIrtkIyrgWwcqNsHvkNbsJ9KA3M3cgNbd3d1vHis@z>

Hello Soc maintainers,

A small pull request for the aspeed platform this time around.

The following changes since commit d0e72be77e7995923fac73f27cf7a75d3d1a4dec:

  soc: aspeed: socinfo: Add new systems (2021-02-10 22:25:45 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.12-soc

for you to fetch changes up to d0e72be77e7995923fac73f27cf7a75d3d1a4dec:

  soc: aspeed: socinfo: Add new systems (2021-02-10 22:25:45 +1030)

----------------------------------------------------------------
ASPEED soc driver updates for 5.12

 - Clock control logic for LPC snoop driver
 - New system ids for AST2600 variants

----------------------------------------------------------------
Jae Hyun Yoo (1):
      soc: aspeed: snoop: Add clock control logic

Joel Stanley (1):
      soc: aspeed: socinfo: Add new systems

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
