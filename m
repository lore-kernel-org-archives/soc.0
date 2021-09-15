Return-Path: <SRS0=M+4a=OF=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A860CC433EF
	for <soc@archiver.kernel.org>; Wed, 15 Sep 2021 11:38:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 89AA361279; Wed, 15 Sep 2021 11:38:17 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60C4B61283
	for <soc@kernel.org>; Wed, 15 Sep 2021 11:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60C4B61283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id q21so509893ljj.6
        for <soc@kernel.org>; Wed, 15 Sep 2021 04:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=cWe6oTyjLmK6VEOjd0bBPZtu4VeJ5Git5yX260+o1+4=;
        b=QDnrgzrAc4ux0j2WKEPJ0XQcs2m1Fwt/rSrzXsTSPthEIgpkHy+4qCh48/tVWzd8lF
         F7zTnRS6IRrazHGVgz3aDdUSPFdt6B7ov2NbewXB+vx1j/IzEnGQ6w8JyWZEjHHfIy3L
         38oAyZU4A2gpBj0td+kfYvTD7n2ZiS/gnpwkp54WAxJexsGz4Ss+z6rYUMdi7DcKYg+F
         k8FaiQjgA/pnvN8Alc0Ww2YkEOiqBZfPIoiNVrDanCsnARa6WyMWsVYJctyZ26sJB5/j
         sY6H0B6Xd4iayb+cNeU3j/F5qOG+GgnfG0mHk/AIdgNJf9Ag13z7AkTpyXh/P8pIPLq1
         Xwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=cWe6oTyjLmK6VEOjd0bBPZtu4VeJ5Git5yX260+o1+4=;
        b=FoiAX9Ej48cFN0JdnASrf+UfVeObY9slesr67k9rO0+XwB/CvPiqp8p8urlOzD3Qkx
         quj6cq52CGmWVaARtc34Nh12sMnhtiD5w6DSXEhm5kWs6jjXvnA4y2vPgexo9l2mUMNH
         +OeimXH5Rw/KjTT1n//x32iN7mc4+clJwB3pGQL0JprPR8ry2f6UuD/uuR5SyUnDilk+
         X2CUpwqDo7jWHaUUGeGv7rS5bqH23dCAypVEZXa9TsNIJ5QC/VGFgOS1RCh5oTCy41zJ
         anLCnSel5jH9gXExO7pmtRSfNSiQfJkqeiIsjfI7wlzlBRdEBxXR0vp63ExDlaNgYdfp
         V1xg==
X-Gm-Message-State: AOAM533OJ+hdoh+W2oc04ZySjVqwCrzSDygIIUOEwQKBB08nj5l/0yiT
	MOMVyA36H75oqKewQCx0U7fpGA==
X-Google-Smtp-Source: ABdhPJwQiFagzIrGruSXaAYXLJqNhFncwn8ij/I4x29RKri2YfRi333HsvvJoyEVSMUaxj5egiq7Qw==
X-Received: by 2002:a2e:a316:: with SMTP id l22mr20891066lje.104.1631705895821;
        Wed, 15 Sep 2021 04:38:15 -0700 (PDT)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id v15sm1370271lfd.34.2021.09.15.04.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 04:38:15 -0700 (PDT)
Date: Wed, 15 Sep 2021 13:38:13 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	CGEL <cgel.zte@gmail.com>
Subject: [GIT PULL] OP-TEE fix for v5.15
Message-ID: <20210915113813.GA509196@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small OP-TEE driver fix for the shared memory pool
handler. The fix doesn't change the generated code, but it's still relevant
since the problem obviously triggers warnings with some tools.

Thanks,
Jens

The following changes since commit 7d2a07b769330c34b4deabeed939325c77a7ec2f:

  Linux 5.14 (2021-08-29 15:04:50 -0700)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix-for-v5.15

for you to fetch changes up to 88a3856c0a8c03188db7913f4d49379432fe1f93:

  tee/optee/shm_pool: fix application of sizeof to pointer (2021-09-14 07:54:56 +0200)

----------------------------------------------------------------
Fix OP-TEE shm_pool lint warning

----------------------------------------------------------------
jing yangyang (1):
      tee/optee/shm_pool: fix application of sizeof to pointer

 drivers/tee/optee/shm_pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
