Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D41B5EBC
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 19:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730747030; cv=none; b=S9rT8dapcBmHUaTgelaCwAXAiK6BD8Cu1HF5EKtD+cQwJKkqaF+IF+DSKPXIBvFFk5s7nVUdymvbLDhC6XShU85iU3DUl9u6bQzJZaep8PBl41+s66s/FrU2vuVFQ6ab6Dswd2Kuwq0EBXybVyfdgavwo5wG8z5WxHd16827ceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730747030; c=relaxed/simple;
	bh=XvdhWma09IaLleTvj56ROWEfmVpcN86+tOqmtSMn5Qo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QqJ/ubaQ1tNS/S/8KOJ8fI9jwgSFsNv8l/MPQd2Xf8UONlmej7YgVl9FikQorEDaUE6vGXxR3+qFGtgYTcqwzwb2Yzc/SkWubKWs8YBdWXEPHsJYmqhDVL90/8zFMST0a6dzAIbFYymEPprNGBltszeCdyO9mjhbutR3KBrhch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Mk6xTTaZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Mk6xTTaZ"
Received: by smtp.kernel.org (Postfix)
	id 5FB65C4CED0; Mon,  4 Nov 2024 19:03:50 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30060C4CECE
	for <soc@kernel.org>; Mon,  4 Nov 2024 19:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30060C4CECE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20bb39d97d1so43027335ad.2
        for <soc@kernel.org>; Mon, 04 Nov 2024 11:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730747027; x=1731351827; darn=kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NA8fP/yMJX4YrX/4tkNWkXd8CoB5Q4SliEG8XZe06KY=;
        b=Mk6xTTaZR3+tJaCTQU2hwzaw+lew2zkDCLhhXfJ03tyw4o1orOzlvlHlwHA96hS3Ra
         SAbRXeozq60ptC07IYovjLApqzEIwLVc5ZFW3J+dBlkoqtgURBb5u960jt9+XQ3RH4cv
         0tl7F0xNqwmuxZDnBnu7yZ52ihMsz7zYKEsCAhWT/XK8HZrTt5hXfz4c91GHdsG9ZtDr
         HRXjdrRNOMBpUmVbH5IN3Ea7xm+wu8myv3BecFEKh+imfKMP9VpCLfCelnHNFIxEMdDx
         9fbWfbj2Z50Ya2Ru3rXzmElHC2LzKjl1gJow1XITvVvCqjZU8MHz9FVbxSFATFX2VoWG
         yk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730747027; x=1731351827;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NA8fP/yMJX4YrX/4tkNWkXd8CoB5Q4SliEG8XZe06KY=;
        b=XCHCpEbskBXZcqZZnbU5e9pvnG7g/GJhdxLepru1zqTeQ0jrXHQ89d3TfLnS6wTuf0
         S90PHAuO8buU7KB2qE6AbWpJs4BpuWX8v5ugqA98IRsPl0K+7LjMPrYwpx9HT7kAHRC0
         JpGbwKAnicXeJ4nb6cqZc8felyEvj31LQuM0Wo/hpGyCZOpRfMQEPHHNE7pS0JmRn7Y/
         we6onozu7rOPSaND14Mrcz1pkjpRbGOSwYVXxfKn2dS4xAp/0sJIEB++QC9p5GnqPBVk
         rYnS9BpoyZ8h4HW7L1ki94+8UvDTsvxVrnV5V2A2rmU7rDeYIYy8LPhX6N8AGT6JnTfP
         2b2A==
X-Gm-Message-State: AOJu0YwTJbFJqMEQIPpu39b3jXe+D20XO236t7ohwgyAN+vTEDK9WrsQ
	eQBsDWL9BYbDoXFKc8ifN6Uox2QIRPMxVJvZ6QlbC98FBHcK+D0jgZwZclF4n1G8fWdVcIVAnCQ
	Ky6Q=
X-Google-Smtp-Source: AGHT+IHCn+jwQGkArcOzaPbcwgPSYj2Q9cK06QQu8ytXtnA4Uxk3VIEJ5QKuxauHvt2qnIwQYyPqwg==
X-Received: by 2002:a17:902:cf12:b0:20d:2e83:6995 with SMTP id d9443c01a7336-210f76d6750mr286890785ad.47.1730747027167;
        Mon, 04 Nov 2024 11:03:47 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211318b562fsm41688915ad.169.2024.11.04.11.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 11:03:46 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: dts: OMAP updates for v6.13
In-Reply-To: <7hmsieomrt.fsf@baylibre.com>
References: <7hmsieomrt.fsf@baylibre.com>
Date: Mon, 04 Nov 2024 11:03:46 -0800
Message-ID: <7hikt2om7h.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Hilman <khilman@baylibre.com> writes:

> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
>
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/dt-signed
>
> for you to fetch changes up to 13746595a1581e09289adf9b5202e237c5e0814b:
>
>   ARM: dts: omap4-kc1: fix twl6030 power node (2024-11-04 10:42:22 -0800)

Oops, ignore this one.  I got an email from linux-next that one of these
patches is missing an SoB.  Will fixup and resend.

I deleted this tag to avoid pulling the wrong one.

Kevin
