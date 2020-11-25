Return-Path: <SRS0=PIpA=E7=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DB2C5519F
	for <soc@archiver.kernel.org>; Wed, 25 Nov 2020 12:01:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3154120715; Wed, 25 Nov 2020 12:01:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D658206E5
	for <soc@kernel.org>; Wed, 25 Nov 2020 12:01:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MG8XG7i4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D658206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-wr1-f44.google.com with SMTP id u12so1671468wrt.0
        for <soc@kernel.org>; Wed, 25 Nov 2020 04:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=3zKQZ7VBivnaM9jKVduh3uJv6aA9cicflV82nD39vUk=;
        b=MG8XG7i4qZ2aAl0KJfacSV/mXUJm4RuaSstWRnLq+rjtfnlRsrJPmv9vZdhMpahPw5
         gJYNCqr5udg3Tbc84wNKxWAGptNVmvhCpQ7Aw5oJZ6iljJVOTvgabXljxICB8Mpq7F3B
         gjaVsqLXUDUdMx3NrBBOFyP23sMw6R7P8oZpWUmIi7DWGdSskr5lqUEhAxtY0xHNVJ/B
         VFkW3h4t5iVlrCjLvOZt+K97K7h1kghq/ufGII6JQWpMIrccXrQIo2TeqEGUENvkVSe3
         nkZvw59bfdrkmuLmlCwmhCgWSb/WKfERC2ZOjSohmYMMbR0RsZ0pARqlh/sGqSO/wuxZ
         r7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=3zKQZ7VBivnaM9jKVduh3uJv6aA9cicflV82nD39vUk=;
        b=CdrpxwoltDGLljcQMubp1f42eIGnNpEtjaFv64ESR0rD5FLo1UmpftAHsAaIfS5+4B
         L3VNKunNE/dmtJQMsvndL4DnjLK/2Owgozoq6ReDYOKL91MOopx3XaLTjXPtKBpVrJbw
         WSUwqrBRi3F+ugMGAnZ8ENNsxzrLswvD/hn/rSUh5nTxJlJ4f7JlSj9FHxnMPFkebkFJ
         OBT3kZKmmxmras8k4Uba1o8/RdiYJgLIF+IrLC8a822LLny8SDU6bhlWkCtdatP3ZFrV
         uNt/jwHXuCmuI/bge18ABbCatCMdeVveQbtnNpP+GH0AJQaSEmtgLq6l7cw0MLBBp5LF
         EbBg==
X-Gm-Message-State: AOAM532qwrxda7UkBvurKWvTqjSVevAGJpwpH68rZZZ1Ollh3IoW1C1F
	G8UfcUxss4CjKh36CO/YrCLZZQ==
X-Google-Smtp-Source: ABdhPJzrCqLUpGNxv8G9Y12RnxZPuIc8lbx4JFE9WG0UPE1mFNyOkP4AgFKAq9W08gdTHbBWhv5iaw==
X-Received: by 2002:adf:d082:: with SMTP id y2mr3805368wrh.301.1606305696769;
        Wed, 25 Nov 2020 04:01:36 -0800 (PST)
Received: from jade (81-236-179-152-no272.tbcn.telia.com. [81.236.179.152])
        by smtp.gmail.com with ESMTPSA id j6sm4336173wrq.38.2020.11.25.04.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 04:01:36 -0800 (PST)
Date: Wed, 25 Nov 2020 13:01:34 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [GIT PULL] OP-TEE driver for v5.11
Message-ID: <20201125120134.GA1642471@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch which allows the OP-TEE driver to work with
ARMv7 based single CPU systems.

Thanks,
Jens

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-valid-memory-type-for-v5.11

for you to fetch changes up to 853735e404244f5496cdb6188c5ed9a0f9627ee6:

  optee: add writeback to valid memory type (2020-11-25 12:51:52 +0100)

----------------------------------------------------------------
Add writeback to valid OP-TEE shared memory types

Allows OP-TEE to work with ARMv7 based single CPU systems by allowing
writeback cache policy for shared memory.

----------------------------------------------------------------
Rui Miguel Silva (1):
      optee: add writeback to valid memory type

 drivers/tee/optee/call.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
